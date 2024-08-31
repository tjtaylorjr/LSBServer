-----------------------------------
-- ID: 5650
-- Item: pair_of_nopales
-- Food Effect: 5min, All Races
-----------------------------------
-- VIT -4
-- AGI +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5650)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, -4)
    target:addMod(xi.mod.AGI, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, -4)
    target:delMod(xi.mod.AGI, 2)
end

return itemObject
