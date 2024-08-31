-----------------------------------
-- ID: 4996
-- Scroll of Mages Ballad III
-- Teaches the song Mages Ballad III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.MAGES_BALLAD_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.MAGES_BALLAD_III)
end

return itemObject
