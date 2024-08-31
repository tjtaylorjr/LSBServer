-----------------------------------
-- func: getmobaction
-- desc: Prints mob's current action to the command user.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getmobaction (mobID)')
end

commandObj.onTrigger = function(player, mobId)
    -- validate mobid
    local targ
    if mobId == nil then
        targ = player:getCursorTarget()
        if not targ or not targ:isMob() then
            error(player, 'You must either provide a mobID or target a mob with your cursor.')
            return
        end
    else
        targ = GetMobByID(mobId)
        if targ == nil then
            error(player, 'Invalid mobID.')
            return
        end
    end

    if not targ then
        return
    end

    -- report mob action
    player:printToPlayer(string.format('%s %i current action ID is %i.', targ:getName(), targ:getID(), targ:getCurrentAction()))
end

return commandObj
