-----------------------------------
-- ID: 4723
-- Scroll of Enblizzard II
-- Teaches the white magic Enblizzard II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ENBLIZZARD_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ENBLIZZARD_II)
end

return itemObject
