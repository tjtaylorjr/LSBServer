-----------------------------------
-- func: getenmity
-- desc: prints the target mob's current CE and VE towards you
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 2,
    parameters = ''
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getenmity')
end

commandObj.onTrigger = function(player)
    local targ = player:getCursorTarget()

    if not targ or not targ:isMob() then
        error(player, 'You must select a target monster with the cursor first.')
        return
    end

    player:printToPlayer(string.format('Your enmity against %s is ... CE = %u ... VE = %u', targ:getName(), targ:getCE(player), targ:getVE(player)))
end

return commandObj
