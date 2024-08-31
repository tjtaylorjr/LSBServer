-----------------------------------
-- ID: 4507
-- Item: rarab_meatball
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 10
-- Strength 2
-- Vitality 2
-- Intelligence -1
-- Attack % 30
-- Attack Cap 20
-- Ranged ATT % 30
-- Ranged ATT Cap 20
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4507)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 10)
    target:addMod(xi.mod.STR, 2)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.INT, -1)
    target:addMod(xi.mod.FOOD_ATTP, 30)
    target:addMod(xi.mod.FOOD_ATT_CAP, 20)
    target:addMod(xi.mod.FOOD_RATTP, 30)
    target:addMod(xi.mod.FOOD_RATT_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 10)
    target:delMod(xi.mod.STR, 2)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.INT, -1)
    target:delMod(xi.mod.FOOD_ATTP, 30)
    target:delMod(xi.mod.FOOD_ATT_CAP, 20)
    target:delMod(xi.mod.FOOD_RATTP, 30)
    target:delMod(xi.mod.FOOD_RATT_CAP, 20)
end

return itemObject
