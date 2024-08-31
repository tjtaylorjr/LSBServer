-----------------------------------
-- ID: 4222
-- Horn Quiver
-- When used, you will obtain one stack of Horn Arrows
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.HORN_ARROW, 99 } })
end

return itemObject
