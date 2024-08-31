-----------------------------------
-- ID: 5561
-- Item: Moogle Pie
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- HP 20
-- MP 20
-- Strength 1
-- Dexterity 1
-- Vitality 1
-- Agility 1
-- Intelligence 1
-- Mind 1
-- Charisma 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5561)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 20)
    target:addMod(xi.mod.MP, 20)
    target:addMod(xi.mod.STR, 1)
    target:addMod(xi.mod.DEX, 1)
    target:addMod(xi.mod.VIT, 1)
    target:addMod(xi.mod.AGI, 1)
    target:addMod(xi.mod.INT, 1)
    target:addMod(xi.mod.MND, 1)
    target:addMod(xi.mod.CHR, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 20)
    target:delMod(xi.mod.MP, 20)
    target:delMod(xi.mod.STR, 1)
    target:delMod(xi.mod.DEX, 1)
    target:delMod(xi.mod.VIT, 1)
    target:delMod(xi.mod.AGI, 1)
    target:delMod(xi.mod.INT, 1)
    target:delMod(xi.mod.MND, 1)
    target:delMod(xi.mod.CHR, 1)
end

return itemObject
