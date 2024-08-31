-----------------------------------
-- ID: 5638
-- Item: pogaca_+1
-- Food Effect: 5Min, All Races
-----------------------------------
-- Lizard Killer +12
-- Resist Paralyze +12
-- HP Recovered While Healing 6
-- MP Recovered While Healing 6
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 360, 5638)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.LIZARD_KILLER, 12)
    target:addMod(xi.mod.PARALYZERES, 12)
    target:addMod(xi.mod.HPHEAL, 6)
    target:addMod(xi.mod.MPHEAL, 6)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.LIZARD_KILLER, 12)
    target:delMod(xi.mod.PARALYZERES, 12)
    target:delMod(xi.mod.HPHEAL, 6)
    target:delMod(xi.mod.MPHEAL, 6)
end

return itemObject
