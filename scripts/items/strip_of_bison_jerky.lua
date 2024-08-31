-----------------------------------
-- ID: 5207
-- Item: strip_of_bison_jerky
-- Food Effect: 60Min, All Races
-----------------------------------
-- Strength 5
-- Mind -2
-- Attack % 18
-- Attack Cap 70
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5207)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, 5)
    target:addMod(xi.mod.MND, -2)
    target:addMod(xi.mod.FOOD_ATTP, 18)
    target:addMod(xi.mod.FOOD_ATT_CAP, 70)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, 5)
    target:delMod(xi.mod.MND, -2)
    target:delMod(xi.mod.FOOD_ATTP, 18)
    target:delMod(xi.mod.FOOD_ATT_CAP, 70)
end

return itemObject
