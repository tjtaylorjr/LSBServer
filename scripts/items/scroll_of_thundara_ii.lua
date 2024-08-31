-----------------------------------
-- ID: 4925
-- Scroll of Thundara II
-- Teaches the black magic Thundara II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.THUNDARA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.THUNDARA_II)
end

return itemObject
