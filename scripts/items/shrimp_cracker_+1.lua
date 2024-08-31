-----------------------------------
-- ID: 5636
-- Item: shrimp_cracker_+1
-- Food Effect: 5Min, All Races
-----------------------------------
-- Vitality 2
-- Defense +10
-- Amorph Killer 12
-- Resist Virus 12
-- HP Recovered While Healing 9
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 300, 5636)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.VIT, 2)
    target:addMod(xi.mod.DEF, 10)
    target:addMod(xi.mod.AMORPH_KILLER, 12)
    target:addMod(xi.mod.VIRUSRES, 12)
    target:addMod(xi.mod.HPHEAL, 9)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.VIT, 2)
    target:delMod(xi.mod.DEF, 10)
    target:delMod(xi.mod.AMORPH_KILLER, 12)
    target:delMod(xi.mod.VIRUSRES, 12)
    target:delMod(xi.mod.HPHEAL, 9)
end

return itemObject
