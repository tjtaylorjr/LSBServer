-----------------------------------
-- ID: 4584
-- Item: serving_of_flounder_meuniere
-- Food Effect: 180Min, All Races
-----------------------------------
-- Dexterity 6
-- Mind -1
-- Ranged ACC 15
-- Ranged ATT % 14
-- Ranged ATT Cap 25
-- Enmity -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4584)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 6)
    target:addMod(xi.mod.MND, -1)
    target:addMod(xi.mod.RACC, 15)
    target:addMod(xi.mod.FOOD_RATTP, 14)
    target:addMod(xi.mod.FOOD_RATT_CAP, 25)
    target:addMod(xi.mod.ENMITY, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 6)
    target:delMod(xi.mod.MND, -1)
    target:delMod(xi.mod.RACC, 15)
    target:delMod(xi.mod.FOOD_RATTP, 14)
    target:delMod(xi.mod.FOOD_RATT_CAP, 25)
    target:delMod(xi.mod.ENMITY, -3)
end

return itemObject
