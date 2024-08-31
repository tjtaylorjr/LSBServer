-----------------------------------
-- ID: 5042
-- Scroll of Swift Etude
-- Teaches the song Swift Etude
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SWIFT_ETUDE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SWIFT_ETUDE)
end

return itemObject
