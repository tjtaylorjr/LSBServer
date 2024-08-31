-----------------------------------
-- ID: 4486
-- Item: Dragon Heart
-- Food Effect: 3 Hr, Galka Only
-----------------------------------
-- Strength 7
-- Intelligence -9
-- MP -40
-- HP 40
-- Dragon Killer 10
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.RAW_MEAT)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 10800, 4486)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.STR, 7)
    target:addMod(xi.mod.INT, -9)
    target:addMod(xi.mod.MP, -40)
    target:addMod(xi.mod.HP, 40)
    target:addMod(xi.mod.DRAGON_KILLER, 10)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.STR, 7)
    target:delMod(xi.mod.INT, -9)
    target:delMod(xi.mod.MP, -40)
    target:delMod(xi.mod.HP, 40)
    target:delMod(xi.mod.DRAGON_KILLER, 10)
end

return itemObject
