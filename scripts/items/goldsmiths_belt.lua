-----------------------------------
-- ID: 15446
-- Item: Goldsmith's Belt
-- Enchantment: Synthesis image support
-- 8Min, All Races
-----------------------------------
-- Enchantment: Synthesis image support
-- Duration: 8Min
-- Goldsmithing Skill +3
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(xi.effect.GOLDSMITHING_IMAGERY) then
        result = 238
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.GOLDSMITHING_IMAGERY, 3, 0, 480)
end

itemObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.GOLDSMITH, 1)
end

itemObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.GOLDSMITH, 1)
end

return itemObject
