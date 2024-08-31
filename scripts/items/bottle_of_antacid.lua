-----------------------------------
-- ID: 4153
-- Item: Antacid
-- Item Effect: This medicine helps remove meal effects.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(xi.effect.FOOD)
end

return itemObject
