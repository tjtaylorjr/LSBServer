-----------------------------------
-- ID: 6218
-- Item: slice of anchovy pizza +1
-- Food Effect: 60 minutes, all Races
-----------------------------------
-- HP +35
-- DEX +2
-- Accuracy +9% (Cap 16)
-- Attack +10% (Cap 21)
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 6218)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 35)
    target:addMod(xi.mod.DEX, 2)
    target:addMod(xi.mod.FOOD_ACCP, 9)
    target:addMod(xi.mod.FOOD_ACC_CAP, 16)
    target:addMod(xi.mod.FOOD_ATTP, 10)
    target:addMod(xi.mod.FOOD_ATT_CAP, 21)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 35)
    target:delMod(xi.mod.DEX, 2)
    target:delMod(xi.mod.FOOD_ACCP, 9)
    target:delMod(xi.mod.FOOD_ACC_CAP, 16)
    target:delMod(xi.mod.FOOD_ATTP, 10)
    target:delMod(xi.mod.FOOD_ATT_CAP, 21)
end

return itemObject
