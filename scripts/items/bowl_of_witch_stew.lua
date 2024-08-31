-----------------------------------
-- ID: 4344
-- Item: witch_stew
-- Food Effect: 4hours, All Races
-----------------------------------
-- Magic Points 45
-- Strength -1
-- Mind 4
-- MP Recovered While Healing 4
-- Enmity -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4344)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 45)
    target:addMod(xi.mod.STR, -1)
    target:addMod(xi.mod.MND, 4)
    target:addMod(xi.mod.MPHEAL, 4)
    target:addMod(xi.mod.ENMITY, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 45)
    target:delMod(xi.mod.STR, -1)
    target:delMod(xi.mod.MND, 4)
    target:delMod(xi.mod.MPHEAL, 4)
    target:delMod(xi.mod.ENMITY, -4)
end

return itemObject
