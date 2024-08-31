-----------------------------------
-- ID: 6277
-- Item: deep-fried_shrimp
-- Food Effect: 60Min, All Races
-----------------------------------
-- VIT +4
-- Fire resistance +21
-- Accuracy +21% (cap 75)
-- Ranged Accuracy +21% (cap 75)
-- Subtle Blow +9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 6277)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, 4)
    target:addMod(xi.mod.FIRE_MEVA, 21)
    target:addMod(xi.mod.FOOD_ACCP, 21)
    target:addMod(xi.mod.FOOD_ACC_CAP, 75)
    target:addMod(xi.mod.FOOD_RACCP, 21)
    target:addMod(xi.mod.FOOD_RACC_CAP, 75)
    target:addMod(xi.mod.SUBTLE_BLOW, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, 4)
    target:delMod(xi.mod.FIRE_MEVA, 21)
    target:delMod(xi.mod.FOOD_ACCP, 21)
    target:delMod(xi.mod.FOOD_ACC_CAP, 75)
    target:delMod(xi.mod.FOOD_RACCP, 21)
    target:delMod(xi.mod.FOOD_RACC_CAP, 75)
    target:delMod(xi.mod.SUBTLE_BLOW, 9)
end

return itemObject
