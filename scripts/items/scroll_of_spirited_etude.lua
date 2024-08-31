-----------------------------------
-- ID: 5037
-- Scroll of Spirited Etude
-- Teaches the song Spirited Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SPIRITED_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SPIRITED_ETUDE)
end

return itemObject
