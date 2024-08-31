-----------------------------------
-- ID: 5012
-- Scroll of Dragonfoe Mambo
-- Teaches the song Dragonfoe Mambo
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.DRAGONFOE_MAMBO)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.DRAGONFOE_MAMBO)
end

return itemObject
