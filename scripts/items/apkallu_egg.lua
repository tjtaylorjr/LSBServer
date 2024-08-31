-----------------------------------
-- ID: 5568
-- Item: Apkallu Egg
-- Food Effect: 5Min, All Races
-----------------------------------
-- Health 6
-- Magic 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5568)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 6)
    target:addMod(xi.mod.MP, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 6)
    target:delMod(xi.mod.MP, 6)
end

return itemObject
