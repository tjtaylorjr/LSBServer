-----------------------------------
-- ID: 5645
-- Item: piece_of_witch_nougat
-- Food Effect: 1hour, All Races
-----------------------------------
-- HP 50
-- Intelligence 3
-- Agility -3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 5645)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 50)
    target:addMod(xi.mod.INT, 3)
    target:addMod(xi.mod.AGI, -3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 50)
    target:delMod(xi.mod.INT, 3)
    target:delMod(xi.mod.AGI, -3)
end

return itemObject
