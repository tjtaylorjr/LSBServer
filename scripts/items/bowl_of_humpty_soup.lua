-----------------------------------
-- ID: 4521
-- Item: Bowl of Humpty Soup
-- Food Effect: 240Min, All Races
-----------------------------------
-- Health % 6
-- Health Cap 35
-- Magic 5
-- Health Regen While Healing 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4521)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 6)
    target:addMod(xi.mod.FOOD_HP_CAP, 35)
    target:addMod(xi.mod.MP, 5)
    target:addMod(xi.mod.HPHEAL, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 6)
    target:delMod(xi.mod.FOOD_HP_CAP, 35)
    target:delMod(xi.mod.MP, 5)
    target:delMod(xi.mod.HPHEAL, 5)
end

return itemObject
