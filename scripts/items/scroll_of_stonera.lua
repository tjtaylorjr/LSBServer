-----------------------------------
-- ID: 4922
-- Scroll of Stonera
-- Teaches the black magic Stonera
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.STONERA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.STONERA)
end

return itemObject
