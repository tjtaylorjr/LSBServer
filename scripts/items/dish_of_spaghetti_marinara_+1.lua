-----------------------------------
-- ID: 5720
-- Item: dish_of_spaghetti_marinara_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP % 15 (cap 130)
-- Vitality 2
-- Defense 6
-- Store TP 6
-- hHP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5720)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 15)
    target:addMod(xi.mod.FOOD_HP_CAP, 130)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.DEF, 6)
    target:addMod(xi.mod.STORETP, 6)
    target:addMod(xi.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 15)
    target:delMod(xi.mod.FOOD_HP_CAP, 130)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.DEF, 6)
    target:delMod(xi.mod.STORETP, 6)
    target:delMod(xi.mod.HPHEAL, 1)
end

return itemObject
