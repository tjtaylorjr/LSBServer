-----------------------------------
-- ID: 5544
-- Item: Crab Stewpot
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP +10% Cap 50
-- MP +10
-- HP Recoverd while healing 5
-- MP Recovered while healing 1
-- Defense +20% Cap 50
-- Evasion +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5544)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 10)
    target:addMod(xi.mod.FOOD_HP_CAP, 50)
    target:addMod(xi.mod.MP, 10)
    target:addMod(xi.mod.HPHEAL, 5)
    target:addMod(xi.mod.MPHEAL, 1)
    target:addMod(xi.mod.FOOD_DEFP, 20)
    target:addMod(xi.mod.FOOD_DEF_CAP, 50)
    target:addMod(xi.mod.EVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 10)
    target:delMod(xi.mod.FOOD_HP_CAP, 50)
    target:delMod(xi.mod.MP, 10)
    target:delMod(xi.mod.HPHEAL, 5)
    target:delMod(xi.mod.MPHEAL, 1)
    target:delMod(xi.mod.FOOD_DEFP, 20)
    target:delMod(xi.mod.FOOD_DEF_CAP, 50)
    target:delMod(xi.mod.EVA, 5)
end

return itemObject
