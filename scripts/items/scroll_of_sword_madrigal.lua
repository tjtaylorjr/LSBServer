-----------------------------------
-- ID: 5007
-- Scroll of Sword Madrigal
-- Teaches the song Sword Madrigal
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SWORD_MADRIGAL)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SWORD_MADRIGAL)
end

return itemObject
