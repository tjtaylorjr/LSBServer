-----------------------------------
-- ID: 4314
-- Item: Bibikibo
-- Food Effect: 5Min, Mithra only
-----------------------------------
-- Dexterity 1
-- Mind -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4314)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 1)
    target:addMod(xi.mod.MND, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 1)
    target:delMod(xi.mod.MND, -3)
end

return itemObject
