-----------------------------------
-- func: posfix
-- desc: Resets a targets account session and warps them to Jeuno.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!posfix <player>')
end

commandObj.onTrigger = function(player, target)
    -- validate target
    if target == nil then
        error(player, 'You must supply the name of an offline player.')
    else
        player:resetPlayer(target)
        player:printToPlayer(string.format('Fixed %s\'s position.', target))
    end
end

return commandObj
