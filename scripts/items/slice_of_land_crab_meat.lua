-----------------------------------
-- ID: 4400
-- Item: slice_of_land_crab_meat
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity -4
-- Vitality 3
-- Defense % 14
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4400)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, -4)
    target:addMod(xi.mod.VIT, 3)
    target:addMod(xi.mod.FOOD_DEFP, 14)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, -4)
    target:delMod(xi.mod.VIT, 3)
    target:delMod(xi.mod.FOOD_DEFP, 14)
end

return itemObject
