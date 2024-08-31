-----------------------------------
-- ID: 4812
-- Scroll of Flare
-- Teaches the black magic Flare
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FLARE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FLARE)
end

return itemObject
