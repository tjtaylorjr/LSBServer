-----------------------------------
-- ID: 4341
-- Item: bowl_of_sunset_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Agility 3
-- Vitality -1
-- HP Recovered While Healing 5
-- Ranged Accuracy % 9 (cap 20)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4341)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, 3)
    target:addMod(xi.mod.VIT, -1)
    target:addMod(xi.mod.HPHEAL, 5)
    target:addMod(xi.mod.FOOD_RACCP, 9)
    target:addMod(xi.mod.FOOD_RACC_CAP, 20)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, 3)
    target:delMod(xi.mod.VIT, -1)
    target:delMod(xi.mod.HPHEAL, 5)
    target:delMod(xi.mod.FOOD_RACCP, 9)
    target:delMod(xi.mod.FOOD_RACC_CAP, 20)
end

return itemObject
