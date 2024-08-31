-----------------------------------
-- ID: 4561
-- Item: Bowl of Seafood Stew
-- Food Effect: 180Min, All Races
-----------------------------------
-- Health 20
-- Dexterity 1
-- Vitality 5
-- Defense % 25
-- Defense Cap 120
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4561)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 20)
    target:addMod(xi.mod.DEX, 1)
    target:addMod(xi.mod.VIT, 5)
    target:addMod(xi.mod.FOOD_DEFP, 25)
    target:addMod(xi.mod.FOOD_DEF_CAP, 120)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 20)
    target:delMod(xi.mod.DEX, 1)
    target:delMod(xi.mod.VIT, 5)
    target:delMod(xi.mod.FOOD_DEFP, 25)
    target:delMod(xi.mod.FOOD_DEF_CAP, 120)
end

return itemObject
