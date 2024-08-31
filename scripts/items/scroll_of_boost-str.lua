-----------------------------------
-- ID: 5094
-- Scroll of Boost-STR
-- Teaches the white magic Boost-STR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BOOST_STR)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BOOST_STR)
end

return itemObject
