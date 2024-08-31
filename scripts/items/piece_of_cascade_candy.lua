-----------------------------------
-- ID: 5942
-- Item: Piece of Cascade Candy
-- Food Effect: 30Min, All Races
-----------------------------------
-- Mind +4
-- Charisma +4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 1800, 5942)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MND, 4)
    target:addMod(xi.mod.CHR, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MND, 4)
    target:delMod(xi.mod.CHR, 4)
end

return itemObject
