-----------------------------------
-- ID: 5579
-- Item: bowl_of_yayla_corbasi
-- Food Effect: 3Hrs, All Races
-----------------------------------
-- HP 20
-- Dexterity -1
-- Vitality 2
-- HP Recovered While Healing 3
-- MP Recovered While Healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 5579)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 20)
    target:addMod(xi.mod.DEX, -1)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.HPHEAL, 3)
    target:addMod(xi.mod.MPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 20)
    target:delMod(xi.mod.DEX, -1)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.HPHEAL, 3)
    target:delMod(xi.mod.MPHEAL, 1)
end

return itemObject
