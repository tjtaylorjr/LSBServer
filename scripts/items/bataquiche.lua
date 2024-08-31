-----------------------------------
-- ID: 5168
-- Item: Bataquiche
-- Food Effect: 30Min, All Races
-----------------------------------
-- Magic 8
-- Agility 1
-- Vitality -2
-- Ranged Acc % 7
-- Ranged Acc Cap 15
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5168)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 8)
    target:addMod(xi.mod.AGI, 1)
    target:addMod(xi.mod.VIT, -2)
    target:addMod(xi.mod.FOOD_RACCP, 7)
    target:addMod(xi.mod.FOOD_RACC_CAP, 15)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 8)
    target:delMod(xi.mod.AGI, 1)
    target:delMod(xi.mod.VIT, -2)
    target:delMod(xi.mod.FOOD_RACCP, 7)
    target:delMod(xi.mod.FOOD_RACC_CAP, 15)
end

return itemObject
