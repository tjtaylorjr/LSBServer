-----------------------------------
-- ID: 5747
-- Item: Jar of Marinara Sauce
-- Food Effect: 5Min, All Races
-----------------------------------
-- Mind 2
-- Intelligence 1
-- HP recovered while healing +1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5747)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MND, 2)
    target:addMod(xi.mod.INT, 1)
    target:addMod(xi.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MND, 2)
    target:delMod(xi.mod.INT, 1)
    target:delMod(xi.mod.HPHEAL, 1)
end

return itemObject
