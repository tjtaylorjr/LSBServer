-----------------------------------
-- ID: 4287
-- Item: opo-opo_tart
-- Food Effect: 1hour, All Races
-----------------------------------
-- HP 12
-- MP 12
-- Intelligence 4
-- MP Recovered While Healing 3
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 3600, 4287)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HP, 12)
    target:addMod(xi.mod.MP, 12)
    target:addMod(xi.mod.INT, 4)
    target:addMod(xi.mod.MPHEAL, 3)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HP, 12)
    target:delMod(xi.mod.MP, 12)
    target:delMod(xi.mod.INT, 4)
    target:delMod(xi.mod.MPHEAL, 3)
end

return itemObject
