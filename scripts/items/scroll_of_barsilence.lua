-----------------------------------
-- ID: 4684
-- Scroll of Barsilence
-- Teaches the white magic Barsilence
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BARSILENCE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BARSILENCE)
end

return itemObject
