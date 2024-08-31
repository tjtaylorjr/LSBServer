-----------------------------------
-- ID: 4276
-- Item: serving_of_flint_caviar
-- Food Effect: 30Min, All Races
-----------------------------------
-- Health 10
-- Magic 10
-- Dexterity 4
-- Mind -1
-- Charisma 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 4276)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 10)
    target:addMod(xi.mod.MP, 10)
    target:addMod(xi.mod.DEX, 4)
    target:addMod(xi.mod.MND, -1)
    target:addMod(xi.mod.CHR, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 10)
    target:delMod(xi.mod.MP, 10)
    target:delMod(xi.mod.DEX, 4)
    target:delMod(xi.mod.MND, -1)
    target:delMod(xi.mod.CHR, 4)
end

return itemObject
