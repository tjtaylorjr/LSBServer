-----------------------------------
-- ID: 5542
-- Item: Gateau aux fraises
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- TODO: Group Effect
-- HP 8
-- MP 8% Cap 50
-- Intelligence 1
-- HP Recovered while healing 1
-- MP Recovered while healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5542)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 8)
    target:addMod(xi.mod.INT, 1)
    target:addMod(xi.mod.FOOD_MPP, 8)
    target:addMod(xi.mod.FOOD_MP_CAP, 50)
    target:addMod(xi.mod.HPHEAL, 1)
    target:addMod(xi.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 8)
    target:delMod(xi.mod.INT, 1)
    target:delMod(xi.mod.FOOD_MPP, 8)
    target:delMod(xi.mod.FOOD_MP_CAP, 50)
    target:delMod(xi.mod.HPHEAL, 1)
    target:delMod(xi.mod.MPHEAL, 1)
end

return itemObject
