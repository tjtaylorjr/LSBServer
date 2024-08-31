-----------------------------------
-- ID: 4788
-- Scroll of Blizzaga II
-- Teaches the black magic Blizzaga II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BLIZZAGA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BLIZZAGA_II)
end

return itemObject
