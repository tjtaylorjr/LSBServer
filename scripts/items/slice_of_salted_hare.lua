-----------------------------------
-- ID: 5737
-- Item: slice_of_salted_hare
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP 10
-- Strength 1
-- hHP +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5737)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 10)
    target:addMod(xi.mod.STR, 1)
    target:addMod(xi.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 10)
    target:delMod(xi.mod.STR, 1)
    target:delMod(xi.mod.HPHEAL, 1)
end

return itemObject
