-----------------------------------
-- ID: 4578
-- Item: sausage
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health % 3 (cap 130)
-- Strength 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
-- Ranged ATT % 27
-- Ranged ATT Cap 30
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4578)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 3)
    target:addMod(xi.mod.FOOD_HP_CAP, 130)
    target:addMod(xi.mod.STR, 3)
    target:addMod(xi.mod.INT, -1)
    target:addMod(xi.mod.FOOD_ATTP, 27)
    target:addMod(xi.mod.FOOD_ATT_CAP, 30)
    target:addMod(xi.mod.FOOD_RATTP, 27)
    target:addMod(xi.mod.FOOD_RATT_CAP, 30)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 3)
    target:delMod(xi.mod.FOOD_HP_CAP, 130)
    target:delMod(xi.mod.STR, 3)
    target:delMod(xi.mod.INT, -1)
    target:delMod(xi.mod.FOOD_ATTP, 27)
    target:delMod(xi.mod.FOOD_ATT_CAP, 30)
    target:delMod(xi.mod.FOOD_RATTP, 27)
    target:delMod(xi.mod.FOOD_RATT_CAP, 30)
end

return itemObject
