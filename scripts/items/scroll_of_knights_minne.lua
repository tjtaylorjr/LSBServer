-----------------------------------
-- ID: 4997
-- Scroll of Knights Minne
-- Teaches the song Mages Ballad
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.KNIGHTS_MINNE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.KNIGHTS_MINNE)
end

return itemObject
