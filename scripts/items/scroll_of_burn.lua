-----------------------------------
-- ID: 4843
-- Scroll of Burn
-- Teaches the black magic Burn
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BURN)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BURN)
end

return itemObject
