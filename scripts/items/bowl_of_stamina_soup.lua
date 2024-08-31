-----------------------------------
-- ID: 4337
-- Item: bowl_of_stamina_soup
-- Food Effect: 4Hrs, All Races
-----------------------------------
-- HP +12% (cap 200)
-- Dexterity 4
-- Vitality 6
-- Mind -3
-- HP Recovered While Healing 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 14400, 4337)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.FOOD_HPP, 12)
    target:addMod(xi.mod.FOOD_HP_CAP, 200)
    target:addMod(xi.mod.DEX, 4)
    target:addMod(xi.mod.VIT, 6)
    target:addMod(xi.mod.MND, -3)
    target:addMod(xi.mod.HPHEAL, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.FOOD_HPP, 12)
    target:delMod(xi.mod.FOOD_HP_CAP, 200)
    target:delMod(xi.mod.DEX, 4)
    target:delMod(xi.mod.VIT, 6)
    target:delMod(xi.mod.MND, -3)
    target:delMod(xi.mod.HPHEAL, 10)
end

return itemObject
