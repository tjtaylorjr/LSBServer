-----------------------------------
-- ID: 4367
-- Item: clump_of_batagreens
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility 2
-- Vitality -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4367)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, 2)
    target:addMod(xi.mod.VIT, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, 2)
    target:delMod(xi.mod.VIT, -4)
end

return itemObject
