-----------------------------------
-- ID: 4854
-- Scroll of Drain II
-- Teaches the black magic Drain II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.DRAIN_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.DRAIN_II)
end

return itemObject
