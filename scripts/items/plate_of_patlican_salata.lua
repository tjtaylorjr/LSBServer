-----------------------------------
-- ID: 5582
-- Item: plate_of_patlican_salata
-- Food Effect: 180Min, All Races
-----------------------------------
-- Agility 4
-- Vitality -1
-- Evasion +6
-- hHP +2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5582)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, 4)
    target:addMod(xi.mod.VIT, -1)
    target:addMod(xi.mod.EVA, 6)
    target:addMod(xi.mod.HPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, 4)
    target:delMod(xi.mod.VIT, -1)
    target:delMod(xi.mod.EVA, 6)
    target:delMod(xi.mod.HPHEAL, 2)
end

return itemObject
