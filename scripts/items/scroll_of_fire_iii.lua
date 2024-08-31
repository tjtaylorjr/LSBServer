-----------------------------------
-- ID: 4754
-- Scroll of Fire III
-- Teaches the black magic Fire III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FIRE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FIRE_III)
end

return itemObject
