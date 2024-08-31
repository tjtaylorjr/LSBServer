-----------------------------------
-- ID: 4750
-- Scroll of Reraise III
-- Teaches the white magic Reraise III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.RERAISE_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.RERAISE_III)
end

return itemObject
