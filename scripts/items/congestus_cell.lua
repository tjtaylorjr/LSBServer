-----------------------------------
-- Congestus Cell
-- ID 5378
-- Removes VIT Down effect
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.salvage.onCellItemCheck(target, xi.effect.DEBILITATION, 0x004)
end

itemObject.onItemUse = function(target)
    return xi.salvage.onCellItemUse(target, xi.effect.DEBILITATION, 0x004, 13)
end

return itemObject
