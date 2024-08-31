-----------------------------------
-- ID: 4613
-- Scroll of Cure V
-- Teaches the white magic Cure V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURE_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURE_V)
end

return itemObject
