-----------------------------------
-- ID: 5274
-- Old Quiver +4
-- When used, you will obtain one partial stack of Crude Arrows +4
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.CRUDE_ARROW_P4, math.random(10, 20) } })
end

return itemObject
