-----------------------------------
-- ID: 6225
-- Item: Cyclical coalescence
-- Food Effect: 30 Min, All Races
-----------------------------------
-- MP +30% (cap 110)
-- INT +7
-- MND +7
-- Magic Atk. Bonus +15
-- Lizard Killer +7
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 6225)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_MPP, 30)
    target:addMod(xi.mod.FOOD_MP_CAP, 110)
    target:addMod(xi.mod.INT, 7)
    target:addMod(xi.mod.MND, 7)
    target:addMod(xi.mod.MATT, 15)
    target:addMod(xi.mod.LIZARD_KILLER, 7)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_MPP, 30)
    target:delMod(xi.mod.FOOD_MP_CAP, 110)
    target:delMod(xi.mod.INT, 7)
    target:delMod(xi.mod.MND, 7)
    target:delMod(xi.mod.MATT, 15)
    target:delMod(xi.mod.LIZARD_KILLER, 7)
end

return itemObject
