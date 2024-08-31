-----------------------------------
-- func: cs
-- desc: Starts the given event for the player.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'iiiiiiiiii'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!cs <csID> (op1) (op2) (op3) (op4) (op5) (op6) (op7) (op8) (texttable)')
end

commandObj.onTrigger = function(player, csid, op1, op2, op3, op4, op5, op6, op7, op8, texttable)
    -- validate csid
    if csid == nil then
        error(player, 'You must enter a cutscene id.')
        return
    end

    -- play cutscene
    if op1 == nil then
        player:startEvent(csid)
    else
        player:startEvent(csid, op1, op2, op3, op4, op5, op6, op7, op8, texttable)
    end
end

return commandObj
