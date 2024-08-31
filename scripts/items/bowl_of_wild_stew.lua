-----------------------------------
-- ID: 4589
-- Item: Bowl of Wild Stew
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength 4
-- Agility 1
-- Vitality 2
-- Intelligence -2
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
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4589)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, 4)
    target:addMod(xi.mod.AGI, 1)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.INT, -2)
    target:addMod(xi.mod.FOOD_ATTP, 25)
    target:addMod(xi.mod.FOOD_ATT_CAP, 50)
    target:addMod(xi.mod.FOOD_RATTP, 25)
    target:addMod(xi.mod.FOOD_RATT_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, 4)
    target:delMod(xi.mod.AGI, 1)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.INT, -2)
    target:delMod(xi.mod.FOOD_ATTP, 25)
    target:delMod(xi.mod.FOOD_ATT_CAP, 50)
    target:delMod(xi.mod.FOOD_RATTP, 25)
    target:delMod(xi.mod.FOOD_RATT_CAP, 50)
end

return itemObject
