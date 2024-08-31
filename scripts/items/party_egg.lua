-----------------------------------
-- ID: 4595
-- Item: party_egg
-- Food Effect: 60Min, All Races
-----------------------------------
-- Health 25
-- Magic 25
-- Attack 5
-- Ranged Attack 4
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4595)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 25)
    target:addMod(xi.mod.MP, 25)
    target:addMod(xi.mod.ATT, 5)
    target:addMod(xi.mod.RATT, 4)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 25)
    target:delMod(xi.mod.MP, 25)
    target:delMod(xi.mod.ATT, 5)
    target:delMod(xi.mod.RATT, 4)
end

return itemObject
