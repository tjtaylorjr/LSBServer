-----------------------------------
-- ID: 5860
-- Item: galkan_sausage_+2
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength 5
-- Intelligence -6
-- Attack 11
-- Ranged Attack 11
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5860)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, 5)
    target:addMod(xi.mod.INT, -6)
    target:addMod(xi.mod.ATT, 11)
    target:addMod(xi.mod.RATT, 11)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, 5)
    target:delMod(xi.mod.INT, -6)
    target:delMod(xi.mod.ATT, 11)
    target:delMod(xi.mod.RATT, 11)
end

return itemObject
