-----------------------------------
-- ID: 4616
-- Scroll of Curaga II
-- Teaches the white magic Curaga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURAGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURAGA_II)
end

return itemObject
