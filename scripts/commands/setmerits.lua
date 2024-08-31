-----------------------------------
-- func: setmerits <amount> <player>
-- desc: Sets the target players merit count.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setmerits <amount> (player)')
end

commandObj.onTrigger = function(player, amount, target)
    -- validate amount
    if amount == nil or amount < 0 then
        error(player, 'Invalid amount.')
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- set merits
    targ:setMerits(amount)
    player:printToPlayer(string.format('%s now has %i merits.', targ:getName(), targ:getMeritCount()))
end

return commandObj
