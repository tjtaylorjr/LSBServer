-----------------------------------
-- ID: 4614
-- Scroll of Cure VI
-- Teaches the white magic Cure VI
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURE_VI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURE_VI)
end

return itemObject
