-----------------------------------
-- ID: 5218
-- Item: serving_of_salmon_roe
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 8
-- Magic 8
-- Dexterity 2
-- Mind -1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5218)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 8)
    target:addMod(xi.mod.MP, 8)
    target:addMod(xi.mod.DEX, 2)
    target:addMod(xi.mod.MND, -1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 8)
    target:delMod(xi.mod.MP, 8)
    target:delMod(xi.mod.DEX, 2)
    target:delMod(xi.mod.MND, -1)
end

return itemObject
