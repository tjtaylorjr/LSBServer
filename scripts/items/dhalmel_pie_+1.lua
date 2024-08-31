-----------------------------------
-- ID: 4322
-- Item: dhalmel_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 25
-- Strength 4
-- Agility 2
-- Vitality 1
-- Intelligence -2
-- Mind 1
-- Attack % 25
-- Attack Cap 50
-- Ranged ATT % 25
-- Ranged ATT Cap 50
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4322)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 25)
    target:addMod(xi.mod.STR, 4)
    target:addMod(xi.mod.AGI, 2)
    target:addMod(xi.mod.VIT, 1)
    target:addMod(xi.mod.INT, -2)
    target:addMod(xi.mod.MND, 1)
    target:addMod(xi.mod.FOOD_ATTP, 25)
    target:addMod(xi.mod.FOOD_ATT_CAP, 50)
    target:addMod(xi.mod.FOOD_RATTP, 25)
    target:addMod(xi.mod.FOOD_RATT_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 25)
    target:delMod(xi.mod.STR, 4)
    target:delMod(xi.mod.AGI, 2)
    target:delMod(xi.mod.VIT, 1)
    target:delMod(xi.mod.INT, -2)
    target:delMod(xi.mod.MND, 1)
    target:delMod(xi.mod.FOOD_ATTP, 25)
    target:delMod(xi.mod.FOOD_ATT_CAP, 50)
    target:delMod(xi.mod.FOOD_RATTP, 25)
    target:delMod(xi.mod.FOOD_RATT_CAP, 50)
end

return itemObject
