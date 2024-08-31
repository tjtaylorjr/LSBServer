-----------------------------------
-- ID: 5036
-- Scroll of Learned Etude
-- Teaches the song Learned Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.LEARNED_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.LEARNED_ETUDE)
end

return itemObject
