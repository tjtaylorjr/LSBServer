-----------------------------------
-- ID: 4525
-- Item: pumpkin_pie_+1
-- Food Effect: 60Min, All Races
-----------------------------------
-- Magic 45
-- Intelligence 4
-- Charisma -1
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4525)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 45)
    target:addMod(xi.mod.INT, 4)
    target:addMod(xi.mod.CHR, -1)
    target:addMod(xi.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 45)
    target:delMod(xi.mod.INT, 4)
    target:delMod(xi.mod.CHR, -1)
    target:delMod(xi.mod.MPHEAL, 1)
end

return itemObject
