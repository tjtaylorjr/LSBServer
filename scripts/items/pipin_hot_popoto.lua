-----------------------------------
-- ID: 4282
-- Item: pipin_hot_popoto
-- Food Effect: 60Min, All Races
-----------------------------------
-- HP 25
-- Vitality 3
-- HP recovered while healing 1
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4282)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 25)
    target:addMod(xi.mod.VIT, 3)
    target:addMod(xi.mod.HPHEAL, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 25)
    target:delMod(xi.mod.VIT, 3)
    target:delMod(xi.mod.HPHEAL, 1)
end

return itemObject
