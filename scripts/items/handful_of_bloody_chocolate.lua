-----------------------------------
-- ID: 5646
-- Item: handful_of_bloody_chocolate
-- Food Effect: 1hour, All Races
-----------------------------------
-- MP Recovered While Healing 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5646)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MPHEAL, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MPHEAL, 4)
end

return itemObject
