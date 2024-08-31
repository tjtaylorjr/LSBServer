-----------------------------------
-- ID: 4333
-- Item: witch_soup
-- Food Effect: 4hours, All Races
-----------------------------------
-- Magic Points 25
-- Strength -1
-- Mind 2
-- MP Recovered While Healing 1
-- Enmity -2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4333)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 25)
    target:addMod(xi.mod.STR, -1)
    target:addMod(xi.mod.MND, 2)
    target:addMod(xi.mod.MPHEAL, 1)
    target:addMod(xi.mod.ENMITY, -2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 25)
    target:delMod(xi.mod.STR, -1)
    target:delMod(xi.mod.MND, 2)
    target:delMod(xi.mod.MPHEAL, 1)
    target:delMod(xi.mod.ENMITY, -2)
end

return itemObject
