-----------------------------------
-- ID: 4352
-- Item: derfland_pear
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -3
-- Intelligence 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4352)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, -3)
    target:addMod(xi.mod.INT, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, -3)
    target:delMod(xi.mod.INT, 1)
end

return itemObject
