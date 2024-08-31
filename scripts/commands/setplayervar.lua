-----------------------------------
-- func: setplayervar
-- desc: Sets a variable on the target player.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'ssi'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setplayervar <player> <variable> <value>')
end

commandObj.onTrigger = function(player, target, variable, value)
    -- validate target
    local targ
    if target == nil then
        error(player, 'You must provide a player name.')
        return
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- validate var
    if variable == nil then
        error(player, 'You must provide a variable name.')
        return
    end

    -- validate value
    if value == nil then
        error(player, 'You must provide a value.')
        return
    end

    targ:setCharVar(variable, value)
    player:printToPlayer(string.format('Set %s\'s variable \'%s\' to %i.', targ:getName(), variable, value))
end

return commandObj
