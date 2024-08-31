-----------------------------------
-- ID: 4619
-- Scroll of Curaga V
-- Teaches the white magic Curaga V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURAGA_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURAGA_V)
end

return itemObject
