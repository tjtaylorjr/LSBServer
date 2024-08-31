-----------------------------------
-- ID: 5920
-- Item: Fudgy-wudge
-- Food Effect: 3 Min, All Races
-----------------------------------
-- Intelligence 1
-- Speed 12.5%
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 180, 5920)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.INT, 1)
    target:addMod(xi.mod.MOVE_SPEED_QUICKENING, 12)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.INT, 1)
    target:delMod(xi.mod.MOVE_SPEED_QUICKENING, 12)
end

return itemObject
