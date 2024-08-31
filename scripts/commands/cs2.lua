-----------------------------------
-- func: cs2
-- desc: Starts the given event for the player.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'issssiiiiiiii'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!cs2 <csID> (string1) (string2) (string3) (string4) (op1) (op2) (op3) (op4) (op5) (op6) (op7) (op8)')
end

commandObj.onTrigger = function(player, csid, string1, string2, string3, string4, op1, op2, op3, op4, op5, op6, op7, op8)
    -- validate csid
    if csid == nil then
        error(player, 'You must enter a cutscene id.')
        return
    end

    -- play cs
    player:startEventString(csid, string1, string2, string3, string4, op1, op2, op3, op4, op5, op6, op7, op8)
end

return commandObj
