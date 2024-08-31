-----------------------------------
-- ID: 4920
-- Scroll of Aerora
-- Teaches the black magic Aerora
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.AERA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.AERA)
end

return itemObject
