-----------------------------------
-- ID: 5172
-- Item: windurst_taco
-- Food Effect: 30Min, All Races
-----------------------------------
-- MP 20
-- Vitality -1
-- Agility 5
-- MP Recovered While Healing 1
-- Ranged Accuracy % 8 (cap 10)
-- Ranged Attack +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5172)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 20)
    target:addMod(xi.mod.VIT, -1)
    target:addMod(xi.mod.AGI, 5)
    target:addMod(xi.mod.MPHEAL, 1)
    target:addMod(xi.mod.RATT, 1)
    target:addMod(xi.mod.FOOD_RACCP, 8)
    target:addMod(xi.mod.FOOD_RACC_CAP, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 20)
    target:delMod(xi.mod.VIT, -1)
    target:delMod(xi.mod.AGI, 5)
    target:delMod(xi.mod.MPHEAL, 1)
    target:delMod(xi.mod.RATT, 1)
    target:delMod(xi.mod.FOOD_RACCP, 8)
    target:delMod(xi.mod.FOOD_RACC_CAP, 10)
end

return itemObject
