-----------------------------------
-- ID: 5960
-- Item: Ulbukan Lobster
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity -3
-- Vitality 1
-- Defense +9%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5960)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, -3)
    target:addMod(xi.mod.VIT, 1)
    target:addMod(xi.mod.DEFP, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, -3)
    target:delMod(xi.mod.VIT, 1)
    target:delMod(xi.mod.DEFP, 9)
end

return itemObject
