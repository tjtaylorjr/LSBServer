-----------------------------------
-- ID: 4608
-- Scroll of Cure (Exclusive)
-- Teaches the white magic Cure
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURE)
end

return itemObject
