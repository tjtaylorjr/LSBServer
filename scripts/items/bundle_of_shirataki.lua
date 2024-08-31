-----------------------------------
-- ID: 5237
-- Item: Bundle of Shirataki
-- Food Effect: 5Min, All Races
-----------------------------------
-- Strength -3
-- Mind 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5237)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, -3)
    target:addMod(xi.mod.MND, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, -3)
    target:delMod(xi.mod.MND, 1)
end

return itemObject
