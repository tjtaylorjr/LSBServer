-----------------------------------
-- ID: 4998
-- Scroll of Knights Minne II
-- Teaches the song Mages Ballad II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.KNIGHTS_MINNE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.KNIGHTS_MINNE_II)
end

return itemObject
