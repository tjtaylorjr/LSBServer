-----------------------------------
-- ID: 5885
-- Item: saltena
-- Food Effect: 30Min, All Races
-----------------------------------
-- HP +6% (cap 100)
-- Increases rate of combat skill gains by 20%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5885)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 6)
    target:addMod(xi.mod.FOOD_HP_CAP, 100)
    target:addMod(xi.mod.COMBAT_SKILLUP_RATE, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 6)
    target:delMod(xi.mod.FOOD_HP_CAP, 100)
    target:delMod(xi.mod.COMBAT_SKILLUP_RATE, 20)
end

return itemObject
