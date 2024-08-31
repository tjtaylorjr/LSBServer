-----------------------------------
-- func: release
-- desc: Releases the player from current events.
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
    player:printToPlayer('!release (name)')
end

commandObj.onTrigger = function(player, name)
    local target
    if name == nil then
        target = player
    else
        target = GetPlayerByName(name)
        if target == nil then
            error(player, string.format('Player named "%s" not found!', name))
            return
        end
    end

    target:release()
end

return commandObj
