-----------------------------------
-- ID: 4802
-- Scroll of Thundaga
-- Teaches the black magic Thundaga
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.THUNDAGA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.THUNDAGA)
end

return itemObject
