-----------------------------------
-- func: setlocalvar <varName> <player/mob/npc> <ID>
-- desc: set player npc or mob local variable and value.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 3,
    parameters = 'siss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setlocalvar <variable name> <value> { \'player\', \'mob\', or \'npc\' } { name or ID }')
end

commandObj.onTrigger = function(player, arg1, arg2, arg3, arg4)
    local zone = player:getZone()
    local varName = arg1
    local varValue = arg2

    if varName == nil then
        error(player, 'You must provide a variable name.')
        return
    end

    if varValue == nil then
        error(player, 'No varaiable value given for target.')
        return
    end

    local targ
    if arg3 == nil then
        targ = player:getCursorTarget()
    elseif arg4 ~= nil then
        local entityType = string.upper(arg3)
        if (entityType == 'NPC') or (entityType == 'MOB') then
            arg4 = tonumber(arg4)
            if not zone then
                return
            end

            if zone:getTypeMask() == xi.zoneType.INSTANCED then
                local instance = player:getInstance()
                if not instance then
                    return
                end

                -- TODO: Solve param type mismatch from number? to integer
                ---@diagnostic disable-next-line: param-type-mismatch
                targ = instance:getEntity(bit.band(arg4, 0xFFF), xi.objType[entityType])
            elseif entityType == 'NPC' then
                ---@diagnostic disable-next-line: param-type-mismatch
                targ = GetNPCByID(arg4)
            else
                ---@diagnostic disable-next-line: param-type-mismatch
                targ = GetMobByID(arg4)
            end
        elseif entityType == 'PLAYER' then
            targ = GetPlayerByName(arg4)
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

    targ:setLocalVar(varName, varValue)
    player:printToPlayer(string.format('%s\'s variable \'%s\' : %i', targ:getName(), varName, varValue))
end

return commandObj
