-----------------------------------
-- ID: 4923
-- Scroll of Stonera II
-- Teaches the black magic Stonera II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.STONERA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.STONERA_II)
end

return itemObject
