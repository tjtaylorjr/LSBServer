-----------------------------------
-- func: getid
-- desc: Prints the ID of the currently selected target under the cursor
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local targ = player:getCursorTarget()
    if targ ~= nil then
        player:printToPlayer(string.format('%s\'s ID is: %u ', targ:getName(), targ:getID()))
    else
        player:printToPlayer('Must select a target using in game cursor first.')
    end
end

return commandObj
