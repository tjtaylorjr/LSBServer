-----------------------------------
-- ID: 6569
-- Scroll of Slow II
-- Teaches the white magic Slow II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SLOW_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SLOW_II)
end

return itemObject
