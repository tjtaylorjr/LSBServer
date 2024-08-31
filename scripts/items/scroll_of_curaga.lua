-----------------------------------
-- ID: 4615
-- Scroll of Curaga
-- Teaches the white magic Curaga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURAGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURAGA)
end

return itemObject
