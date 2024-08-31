-----------------------------------
-- ID: 5931
-- Item: Bowl of Shimmy Soup
-- Food Effect: 4 Hrs, All Races
-----------------------------------
-- MP 32
-- Mind 5
-- HP Recovered While Healing 5
-- Enmity -5
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 5931)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 32)
    target:addMod(xi.mod.MND, 5)
    target:addMod(xi.mod.HPHEAL, 5)
    target:addMod(xi.mod.ENMITY, -5)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 32)
    target:delMod(xi.mod.MND, 5)
    target:delMod(xi.mod.HPHEAL, 5)
    target:delMod(xi.mod.ENMITY, -5)
end

return itemObject
