-----------------------------------
-- ID: 4994
-- Scroll of Mages Ballad
-- Teaches the song Mages Ballad
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.MAGES_BALLAD)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.MAGES_BALLAD)
end

return itemObject
