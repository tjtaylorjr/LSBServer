-----------------------------------
-- ID: 5925
-- Item: Charred Salisbury Steak
-- Food Effect: 240 Min, All Races
-----------------------------------
-- HP +32
-- Strength +8
-- Intelligence -6
-- Attack % 22 Cap 165
-- Ranged Attack %22 Cap 165
-- Dragon Killer +5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 5925)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 32)
    target:addMod(xi.mod.STR, 8)
    target:addMod(xi.mod.INT, -6)
    target:addMod(xi.mod.FOOD_ATTP, 22)
    target:addMod(xi.mod.FOOD_ATT_CAP, 165)
    target:addMod(xi.mod.FOOD_RATTP, 22)
    target:addMod(xi.mod.FOOD_RATT_CAP, 165)
    target:addMod(xi.mod.DRAGON_KILLER, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 32)
    target:delMod(xi.mod.STR, 8)
    target:delMod(xi.mod.INT, -6)
    target:delMod(xi.mod.FOOD_ATTP, 22)
    target:delMod(xi.mod.FOOD_ATT_CAP, 165)
    target:delMod(xi.mod.FOOD_RATTP, 22)
    target:delMod(xi.mod.FOOD_RATT_CAP, 165)
    target:delMod(xi.mod.DRAGON_KILLER, 5)
end

return itemObject
