-----------------------------------
-- ID: 5543
-- Item: midwinter_dream
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP 10
-- MP 8% Cap 60
-- Intelligence 2
-- HP Recovered while healing 2
-- MP Recovered while healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 5543)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 10)
    target:addMod(xi.mod.INT, 2)
    target:addMod(xi.mod.FOOD_MPP, 8)
    target:addMod(xi.mod.FOOD_MP_CAP, 60)
    target:addMod(xi.mod.HPHEAL, 2)
    target:addMod(xi.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 10)
    target:delMod(xi.mod.INT, 2)
    target:delMod(xi.mod.FOOD_MPP, 8)
    target:delMod(xi.mod.FOOD_MP_CAP, 60)
    target:delMod(xi.mod.HPHEAL, 2)
    target:delMod(xi.mod.MPHEAL, 2)
end

return itemObject
