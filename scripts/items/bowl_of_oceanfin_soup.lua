-----------------------------------
-- ID: 6070
-- Item: Bowl of Oceanfin Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- Accuracy % 15 Cap 95
-- Ranged Accuracy % 15 Cap 95
-- Attack % 19 Cap 85
-- Ranged Attack % 19 Cap 85
-- Amorph Killer 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 6070)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_ACCP, 15)
    target:addMod(xi.mod.FOOD_ACC_CAP, 95)
    target:addMod(xi.mod.FOOD_RACCP, 15)
    target:addMod(xi.mod.FOOD_RACC_CAP, 95)
    target:addMod(xi.mod.FOOD_ATTP, 19)
    target:addMod(xi.mod.FOOD_ATT_CAP, 85)
    target:addMod(xi.mod.FOOD_RATTP, 19)
    target:addMod(xi.mod.FOOD_RATT_CAP, 85)
    target:addMod(xi.mod.AMORPH_KILLER, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_ACCP, 15)
    target:delMod(xi.mod.FOOD_ACC_CAP, 95)
    target:delMod(xi.mod.FOOD_RACCP, 15)
    target:delMod(xi.mod.FOOD_RACC_CAP, 95)
    target:delMod(xi.mod.FOOD_ATTP, 19)
    target:delMod(xi.mod.FOOD_ATT_CAP, 85)
    target:delMod(xi.mod.FOOD_RATTP, 19)
    target:delMod(xi.mod.FOOD_RATT_CAP, 85)
    target:delMod(xi.mod.AMORPH_KILLER, 6)
end

return itemObject
