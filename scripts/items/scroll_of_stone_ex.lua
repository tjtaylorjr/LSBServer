-----------------------------------
-- ID: 4607
-- Scroll of Stone (Exclusive)
-- Teaches the black magic Stone
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.STONE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.STONE)
end

return itemObject
