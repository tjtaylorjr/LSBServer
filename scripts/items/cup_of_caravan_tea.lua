-----------------------------------
-- ID: 5927
-- Item: Cup of Caravan Tea
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- HP 22
-- MP 32
-- Charisma 6
-- Intelligence 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 5927)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 22)
    target:addMod(xi.mod.MP, 32)
    target:addMod(xi.mod.CHR, 6)
    target:addMod(xi.mod.INT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 22)
    target:delMod(xi.mod.MP, 32)
    target:delMod(xi.mod.CHR, 6)
    target:delMod(xi.mod.INT, 4)
end

return itemObject
