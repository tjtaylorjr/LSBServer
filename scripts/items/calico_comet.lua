-----------------------------------
-- ID: 5715
-- Item: Calico Comet
-- Food Effect: 5 Min, Mithra only
-----------------------------------
-- Dexterity 2
-- Mind -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_FISH)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5715)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.DEX, 2)
    target:addMod(xi.mod.MND, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.DEX, 2)
    target:delMod(xi.mod.MND, -4)
end

return itemObject
