-----------------------------------
-- ID: 5038
-- Scroll of Enchanting Etude
-- Teaches the song Enchanting Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ENCHANTING_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ENCHANTING_ETUDE)
end

return itemObject
