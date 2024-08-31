-----------------------------------
-- ID: 5977
-- Item: Bowl of Ulbuconut Milk +1
-- Food Effect: 3Min, All Races
-----------------------------------
-- Charisma +4
-- Vitality -1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 180, 5977)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.CHR, 4)
    target:addMod(xi.mod.VIT, -1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.CHR, 4)
    target:delMod(xi.mod.VIT, -1)
end

return itemObject
