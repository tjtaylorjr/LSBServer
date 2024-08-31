-----------------------------------
-- ID: 4563
-- Item: pamama_tart
-- Food Effect: 1hour, All Races
-----------------------------------
-- HP 10
-- MP 10
-- Dexterity -1
-- Intelligence 3
-- MP Recovered While Healing 2
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4563)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 10)
    target:addMod(xi.mod.MP, 10)
    target:addMod(xi.mod.DEX, -1)
    target:addMod(xi.mod.INT, 3)
    target:addMod(xi.mod.MPHEAL, 2)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 10)
    target:delMod(xi.mod.MP, 10)
    target:delMod(xi.mod.DEX, -1)
    target:delMod(xi.mod.INT, 3)
    target:delMod(xi.mod.MPHEAL, 2)
end

return itemObject
