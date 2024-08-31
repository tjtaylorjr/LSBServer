-----------------------------------
-- ID: 4867
-- Scroll of Sleep II
-- Teaches the black magic Sleep II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SLEEP_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SLEEP_II)
end

return itemObject
