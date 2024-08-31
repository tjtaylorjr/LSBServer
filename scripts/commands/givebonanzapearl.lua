-----------------------------------
-- func: givebonanzapearl <player> <number> <eventnum>
-- desc: Gives a bonanza pearl with <number> for <eventnum>
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = 'sii'
}

commandObj.onTrigger = function(player, target, selectedNum, eventNum)
    if
        target == nil or
        selectedNum == nil or
        eventNum == nil
    then
        player:printToPlayer('You must enter a valid player name, number, and event number.')
        return
    end

    local targ = GetPlayerByName(target)
    if targ == nil then
        player:printToPlayer(string.format('Player named "%s" not found!', target))
        return
    end

    -- Attempt to give the target the item..
    if targ:getFreeSlotsCount() == 0 then
        player:printToPlayer(string.format('Player \'%s\' does not have free space for that item!', target))
    else
        targ:addItem({ id = xi.item.BONANZA_PEARL,
            exdata =
            {
                [0] = bit.band(selectedNum, 0xFF),
                [1] = bit.band(bit.rshift(selectedNum,  8), 0xFF),
                [2] = bit.band(bit.rshift(selectedNum, 16), 0xFF),
                [3] = bit.band(eventNum, 0xFF),
            }
        })

        player:printToPlayer(string.format('Gave player \'%s\' Item with ID of \'%u\'', target, xi.item.BONANZA_PEARL))
    end
end

return commandObj
