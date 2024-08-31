-----------------------------------
-- ID: 4468
-- Item: Bunch of Pamamas
-- Food Effect: 30Min, All Races
-----------------------------------
-- Strength -3
-- Intelligence 1
-- Additional Effect with Opo-Opo Crown
-- HP 50
-- MP 50
-- CHR 14
-- Additional Effect with Kinkobo or
-- Primate Staff
-- DELAY -90
-- ACC 10
-- Additional Effect with Primate Staff +1
-- DELAY -80
-- ACC 12
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4468)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, -3)
    target:addMod(xi.mod.INT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, -3)
    target:delMod(xi.mod.INT, 1)
end

return itemObject
