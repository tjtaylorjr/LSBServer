-----------------------------------
-- ID: 4984
-- Scroll of Horde Lullaby
-- Teaches the song Horde Lullaby
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HORDE_LULLABY)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HORDE_LULLABY)
end

return itemObject
