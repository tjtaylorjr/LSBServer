-----------------------------------
-- ID: 4436
-- Item: Baked Popoto
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 20
-- Dexterity -1
-- Vitality 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4436)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 20)
    target:addMod(xi.mod.DEX, -1)
    target:addMod(xi.mod.VIT, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 20)
    target:delMod(xi.mod.DEX, -1)
    target:delMod(xi.mod.VIT, 2)
end

return itemObject
