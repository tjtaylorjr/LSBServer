-----------------------------------
-- ID: 4335
-- Item: slice_of_juicy_mutton
-- Food Effect: 240Min, All Races
-----------------------------------
-- Strength 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 35
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4335)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, 3)
    target:addMod(xi.mod.INT, -1)
    target:addMod(xi.mod.FOOD_ATTP, 27)
    target:addMod(xi.mod.FOOD_ATT_CAP, 35)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, 3)
    target:delMod(xi.mod.INT, -1)
    target:delMod(xi.mod.FOOD_ATTP, 27)
    target:delMod(xi.mod.FOOD_ATT_CAP, 35)
end

return itemObject
