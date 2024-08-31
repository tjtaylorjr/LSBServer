-----------------------------------
-- ID: 5273
-- Old Quiver +3
-- When used, you will obtain one partial stack of Crude Arrows +3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.CRUDE_ARROW_P3, math.random(10, 20) } })
end

return itemObject
