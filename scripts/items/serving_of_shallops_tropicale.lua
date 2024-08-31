-----------------------------------
-- ID: 4554
-- Item: serving_of_shallops_tropicale
-- Food Effect: 180Min, All Races
-----------------------------------
-- Magic 20
-- Dexterity 1
-- Vitality 4
-- Intelligence 1
-- Defense % 25
-- Defense Cap 100
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4554)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 20)
    target:addMod(xi.mod.DEX, 1)
    target:addMod(xi.mod.VIT, 4)
    target:addMod(xi.mod.INT, 1)
    target:addMod(xi.mod.FOOD_DEFP, 25)
    target:addMod(xi.mod.FOOD_DEF_CAP, 100)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 20)
    target:delMod(xi.mod.DEX, 1)
    target:delMod(xi.mod.VIT, 4)
    target:delMod(xi.mod.INT, 1)
    target:delMod(xi.mod.FOOD_DEFP, 25)
    target:delMod(xi.mod.FOOD_DEF_CAP, 100)
end

return itemObject
