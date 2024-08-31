-----------------------------------
-- ID: 4598
-- Item: wild_pineapple
-- Food Effect: 5Min, All Races
-----------------------------------
-- Agility -5
-- Intelligence 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 4598)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.AGI, -5)
    target:addMod(xi.mod.INT, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.AGI, -5)
    target:delMod(xi.mod.INT, 3)
end

return itemObject
