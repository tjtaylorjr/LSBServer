-----------------------------------
-- ID: 6417
-- Divine Quiver
-- When used, you will obtain one stack of Divine Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.DIVINE_ARROW, 99 } })
end

return itemObject
