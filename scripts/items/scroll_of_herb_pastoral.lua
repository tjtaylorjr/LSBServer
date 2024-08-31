-----------------------------------
-- ID: 5014
-- Scroll of Herb Pastoral
-- Teaches the song Herb Pastoral
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HERB_PASTORAL)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HERB_PASTORAL)
end

return itemObject
