-----------------------------------
-- Velum Cell
-- ID 5380
-- Removes INT Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.salvage.onCellItemCheck(target, xi.effect.DEBILITATION, 0x010)
end

itemObject.onItemUse = function(target)
    return xi.salvage.onCellItemUse(target, xi.effect.DEBILITATION, 0x010, 15)
end

return itemObject
