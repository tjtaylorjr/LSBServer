-----------------------------------
-- ID: 4618
-- Scroll of Curaga IV
-- Teaches the white magic Curaga IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURAGA_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURAGA_IV)
end

return itemObject
