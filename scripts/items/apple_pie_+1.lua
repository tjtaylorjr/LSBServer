-----------------------------------
-- ID: 4320
-- Item: Apple Pie +1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Magic 30
-- Intelligence 4
-- Magic Regen While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4320)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 30)
    target:addMod(xi.mod.INT, 4)
    target:addMod(xi.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 30)
    target:delMod(xi.mod.INT, 4)
    target:delMod(xi.mod.MPHEAL, 2)
end

return itemObject
