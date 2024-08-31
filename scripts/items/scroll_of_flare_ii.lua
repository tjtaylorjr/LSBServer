-----------------------------------
-- ID: 4813
-- Scroll of Flare II
-- Teaches the black magic Flare II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FLARE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FLARE_II)
end

return itemObject
