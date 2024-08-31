-----------------------------------
-- ID: 4638
-- Scroll of Banish III
-- Teaches the white magic Banish III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BANISH_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BANISH_III)
end

return itemObject
