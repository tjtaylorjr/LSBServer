-----------------------------------
-- ID: 4343
-- Item: witch_kabob
-- Food Effect: 1hour, All Races
-----------------------------------
-- Magic Points 15
-- Mind 4
-- Enmity -1
-- MP Recovered While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4343)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 15)
    target:addMod(xi.mod.MND, 4)
    target:addMod(xi.mod.ENMITY, -1)
    target:addMod(xi.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 15)
    target:delMod(xi.mod.MND, 4)
    target:delMod(xi.mod.ENMITY, -1)
    target:delMod(xi.mod.MPHEAL, 3)
end

return itemObject
