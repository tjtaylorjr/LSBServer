-----------------------------------
-- ID: 5930
-- Item: Bowl of Sprightly Soup
-- Food Effect: 3 Hrs, All Races
-----------------------------------
-- MP 30
-- Mind 4
-- HP Recovered While Healing 4
-- Enmity -4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5930)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MP, 30)
    target:addMod(xi.mod.MND, 4)
    target:addMod(xi.mod.HPHEAL, 4)
    target:addMod(xi.mod.ENMITY, -4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MP, 30)
    target:delMod(xi.mod.MND, 4)
    target:delMod(xi.mod.HPHEAL, 4)
    target:delMod(xi.mod.ENMITY, -4)
end

return itemObject
