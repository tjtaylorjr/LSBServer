-----------------------------------
-- ID: 5891
-- Item: seafood_pitaru
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +8% (cap 120)
-- Increases rate of magic skill gains by 60%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5891)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_MPP, 8)
    target:addMod(xi.mod.FOOD_MP_CAP, 120)
    target:addMod(xi.mod.MAGIC_SKILLUP_RATE, 60)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_MPP, 8)
    target:delMod(xi.mod.FOOD_MP_CAP, 120)
    target:delMod(xi.mod.MAGIC_SKILLUP_RATE, 60)
end

return itemObject
