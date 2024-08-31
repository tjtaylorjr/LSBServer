-----------------------------------
-- ID: 4995
-- Scroll of Mages Ballad II
-- Teaches the song Mages Ballad II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.MAGES_BALLAD_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.MAGES_BALLAD_II)
end

return itemObject
