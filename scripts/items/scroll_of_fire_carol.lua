-----------------------------------
-- ID: 5046
-- Scroll of Fire Carol
-- Teaches the song Fire Carol
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FIRE_CAROL)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FIRE_CAROL)
end

return itemObject
