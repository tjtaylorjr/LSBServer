-----------------------------------
-- ID: 4913
-- Scroll of Distract
-- Teaches the black magic Distract II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.DISTRACT_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.DISTRACT_II)
end

return itemObject
