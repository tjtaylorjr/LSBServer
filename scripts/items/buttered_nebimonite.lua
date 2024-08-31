-----------------------------------
-- ID: 4267
-- Item: Buttered Nebimonite
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 1
-- Vitality 2
-- defense % 25
-- defense Cap 75
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4267)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 1)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.FOOD_DEFP, 25)
    target:addMod(xi.mod.FOOD_DEF_CAP, 75)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 1)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.FOOD_DEFP, 25)
    target:delMod(xi.mod.FOOD_DEF_CAP, 75)
end

return itemObject
