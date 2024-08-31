-----------------------------------
-- Pileus Cell
-- ID 5381
-- Removes MND Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.salvage.onCellItemCheck(target, xi.effect.DEBILITATION, 0x020)
end

itemObject.onItemUse = function(target)
    return xi.salvage.onCellItemUse(target, xi.effect.DEBILITATION, 0x020, 16)
end

return itemObject
