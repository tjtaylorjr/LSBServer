-----------------------------------
-- ID: 5453
-- Item: Istakoz
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -5
-- Vitality 3
-- Defense +16% (cap 50)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5453)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, -5)
    target:addMod(xi.mod.VIT, 3)
    target:addMod(xi.mod.FOOD_DEFP, 16)
    target:addMod(xi.mod.FOOD_DEF_CAP, 50)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, -5)
    target:delMod(xi.mod.VIT, 3)
    target:delMod(xi.mod.FOOD_DEFP, 16)
    target:delMod(xi.mod.FOOD_DEF_CAP, 50)
end

return itemObject
