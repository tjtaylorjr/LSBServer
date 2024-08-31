-----------------------------------
-- func: breaklinkshell
-- desc: Breaks a linkshell and all pearls/sacks
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 4,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!breaklinkshell <linkshell name>')
end

commandObj.onTrigger = function(player, target)
    -- validate target
    if not target then
        error(player, 'You must enter a linkshell name.')
        return
    end

    if player:breakLinkshell(target) then
        player:printToPlayer('Linkshell named \''..target..'\' has been broken!')
    else
        error(player, string.format('Linkshell named \'%s\' not found!', target))
    end
end

return commandObj
