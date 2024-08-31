-----------------------------------
-- ID: 4221
-- Item: Beetle Quiver
-- When used, you will obtain one stack of Beetle Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.BEETLE_ARROW, 99 } })
end

return itemObject
