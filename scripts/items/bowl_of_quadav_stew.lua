-----------------------------------
-- ID: 4569
-- Item: Bowl of Quadav Stew
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility -4
-- Vitality 2
-- Defense % 17
-- Defense Cap 60
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4569)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, -4)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.FOOD_DEFP, 17)
    target:addMod(xi.mod.FOOD_DEF_CAP, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, -4)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.FOOD_DEFP, 17)
    target:delMod(xi.mod.FOOD_DEF_CAP, 60)
end

return itemObject
