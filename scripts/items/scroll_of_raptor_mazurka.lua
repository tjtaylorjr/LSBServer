-----------------------------------
-- ID: 5075
-- Scroll of Raptor Mazurka
-- Teaches the song Raptor Mazurka
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.RAPTOR_MAZURKA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.RAPTOR_MAZURKA)
end

return itemObject
