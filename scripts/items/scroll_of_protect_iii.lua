-----------------------------------
-- ID: 4653
-- Scroll of Protect III
-- Teaches the white magic Protect III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.PROTECT_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.PROTECT_III)
end

return itemObject
