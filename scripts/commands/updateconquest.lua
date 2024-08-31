-----------------------------------
-- func: updateconquest
-- desc: Updates all conquest guard. (Need modify in db first.)
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
    player:printToPlayer('!updateconquest <type>')
    player:printToPlayer('Type: 0 = Conquest_Tally_Start, 1 = Conquest_Tally_End, 2 = Conquest_Update')
end

commandObj.onTrigger = function(player, updatetype)
    if updatetype == nil or updatetype < 0 or updatetype > 2 then
        error(player, 'Invalid update type.')
        return
    end

    WeekUpdateConquest(updatetype)
end

return commandObj
