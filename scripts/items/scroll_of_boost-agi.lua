-----------------------------------
-- ID: 5097
-- Scroll of Boost-AGI
-- Teaches the white magic Boost-AGI
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BOOST_AGI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BOOST_AGI)
end

return itemObject
