-----------------------------------
-- ID: 5572
-- Item: irmik_helvasi
-- Food Effect: 3 hours, All Races
-----------------------------------
-- HP +10% (cap 75)
-- MP +3% (cap 13)
-- INT +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5572)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 10)
    target:addMod(xi.mod.FOOD_HP_CAP, 75)
    target:addMod(xi.mod.FOOD_MPP, 3)
    target:addMod(xi.mod.FOOD_MP_CAP, 13)
    target:addMod(xi.mod.INT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 10)
    target:delMod(xi.mod.FOOD_HP_CAP, 75)
    target:delMod(xi.mod.FOOD_MPP, 3)
    target:delMod(xi.mod.FOOD_MP_CAP, 13)
    target:delMod(xi.mod.INT, 1)
end

return itemObject
