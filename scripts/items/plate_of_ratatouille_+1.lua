-----------------------------------
-- ID: 5732
-- Item: plate_of_ratatouille_+1
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- Agility 6
-- Evasion 10
-- HP recovered while healing 3
-- MP recovered while healing 3
-- Undead Killer 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 5732)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, 6)
    target:addMod(xi.mod.EVA, 10)
    target:addMod(xi.mod.HPHEAL, 3)
    target:addMod(xi.mod.MPHEAL, 3)
    target:addMod(xi.mod.UNDEAD_KILLER, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, 6)
    target:delMod(xi.mod.EVA, 10)
    target:delMod(xi.mod.HPHEAL, 3)
    target:delMod(xi.mod.MPHEAL, 3)
    target:delMod(xi.mod.UNDEAD_KILLER, 10)
end

return itemObject
