-----------------------------------
-- func: delitem
-- desc: Deletes a single item held by a player, if they have it.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!delitem <itemID> (player)')
end

commandObj.onTrigger = function(player, itemId, target)
    -- validate itemId
    if itemId == nil or itemId < 1 then
        error(player, 'Invalid itemID.')
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- search target inventory for item, and delete if found
    for i = xi.inv.INVENTORY, xi.inv.WARDROBE8 do -- inventory locations enums
        if targ:hasItem(itemId, i) then
            targ:delItem(itemId, 1, i)
            player:printToPlayer(string.format('Item %i was deleted from %s.', itemId, targ:getName()))
            break
        end

        if i == xi.inv.WARDROBE8 then -- Wardrobe 8 is the last inventory location, if it reaches this point then the player does not have the item anywhere.
            player:printToPlayer(string.format('%s does not have item %i.', targ:getName(), itemId))
        end
    end
end

return commandObj
