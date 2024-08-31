-----------------------------------
-- ID: 5039
-- Scroll of Herculean Etude
-- Teaches the song Herculean Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HERCULEAN_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HERCULEAN_ETUDE)
end

return itemObject
