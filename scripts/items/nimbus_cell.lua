-----------------------------------
-- Nimbus Cell
-- 5379
-- Removes AGI Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.salvage.onCellItemCheck(target, xi.effect.DEBILITATION, 0x008)
end

itemObject.onItemUse = function(target)
    return xi.salvage.onCellItemUse(target, xi.effect.DEBILITATION, 0x008, 14)
end

return itemObject
