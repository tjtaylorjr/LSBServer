-----------------------------------
-- func: checklocalvar <varName> { 'player'/'mob'/'npc' } { name/ID }
-- desc: checks player or npc local variable and returns result value.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'sss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!checklocalvar <variable name> { \'player\', \'mob\', or \'npc\' } { name or ID }')
end

commandObj.onTrigger = function(player, arg1, arg2, arg3)
    local zone = player:getZone()
    local varName = arg1
    local targ = arg3

    if varName == nil then
        error(player, 'You must provide a variable name.')
        return
    end

    if arg2 == nil then
        targ = player:getCursorTarget()
    elseif arg3 ~= nil then
        local entityType = string.upper(arg2)
        if entityType == 'NPC' or entityType == 'MOB' then
            arg3 = tonumber(arg3)
            if zone and zone:getTypeMask() == xi.zoneType.INSTANCED then
                local instance = player:getInstance()

                if not instance then
                    return
                end

                -- TODO: Solve param type mismatch from number? to integer
                ---@diagnostic disable-next-line: param-type-mismatch
                targ = instance:getEntity(bit.band(arg3, 0xFFF), xi.objType[entityType])
            elseif entityType == 'NPC' then
                ---@diagnostic disable-next-line param-type-mismatch
                targ = GetNPCByID(arg3)
            else
                ---@diagnostic disable-next-line param-type-mismatch
                targ = GetMobByID(arg3)
            end
        elseif entityType == 'PLAYER' then
            targ = GetPlayerByName(arg3)
        else
            error(player, 'Invalid entity type.')
            return
        end
    else
        error(player, 'Need to specify a target.')
        return
    end

    if targ == nil then
        error(player, 'Invalid target.')
        return
    end

    player:printToPlayer(string.format('%s\'s variable \'%s\' : %i', targ:getName(), varName, targ:getLocalVar(varName)))
end

return commandObj
