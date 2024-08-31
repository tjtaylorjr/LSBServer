-----------------------------------
-- ID: 5591
-- Item: Balik Sandvic +1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Dexterity 3
-- Agility 1
-- Intelligence 3
-- Mind -2
-- Ranged ACC 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5591)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 3)
    target:addMod(xi.mod.AGI, 1)
    target:addMod(xi.mod.INT, 3)
    target:addMod(xi.mod.MND, -2)
    target:addMod(xi.mod.RACC, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 3)
    target:delMod(xi.mod.AGI, 1)
    target:delMod(xi.mod.INT, 3)
    target:delMod(xi.mod.MND, -2)
    target:delMod(xi.mod.RACC, 6)
end

return itemObject
