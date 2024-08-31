-----------------------------------
-- func: getwspoints
-- desc: prints current ws points, optionaly specifying the weapon slot to check (default main)
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'ss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!getwspoints (main/sub/ranged) (optional target)')
end

commandObj.onTrigger = function(player, equipSlot, name)
    local target = player:getCursorTarget()

    if name then
        target = GetPlayerByName(name)
        if not target then
            error(player, string.format('player named %s not found!', name))
            return
        end
    else
        if not target then
            target = player
        end

        name = target:getName()
    end

    if not target:isPC() then
        error(player, 'Invalid target!')
        return
    end

    if not equipSlot then
        equipSlot = 'main'
        player:printToPlayer('No equip slot specified, defaulting to mainhand weapon.')
    end

    local equip = xi.slot[string.upper(equipSlot)]
    if not equip or equip > xi.slot.RANGED then
        error(player, 'Invalid equip slot specified.')
        return
    end

    local points = target:getStorageItem(0, 0, equip):getWeaponskillPoints()
    player:printToPlayer(string.format('The weapon in %s\'s %s slot has %i ws points', name, equipSlot, points))
end

return commandObj
