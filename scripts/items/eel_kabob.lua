-----------------------------------
-- ID: 4457
-- Item: eel_kabob
-- Food Effect: 30Min, All Races
-----------------------------------
-- Dexterity 4
-- Mind -3
-- Evasion 5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4457)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 4)
    target:addMod(xi.mod.MND, -3)
    target:addMod(xi.mod.EVA, 5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 4)
    target:delMod(xi.mod.MND, -3)
    target:delMod(xi.mod.EVA, 5)
end

return itemObject
