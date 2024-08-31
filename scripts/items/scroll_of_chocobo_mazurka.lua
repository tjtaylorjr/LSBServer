-----------------------------------
-- ID: 5073
-- Scroll of Chocobo Mazurka
-- Teaches the song Chocobo Mazurka
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CHOCOBO_MAZURKA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CHOCOBO_MAZURKA)
end

return itemObject
