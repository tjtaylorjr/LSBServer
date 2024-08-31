-----------------------------------
-- ID: 4633
-- Scroll of Dia III
-- Teaches the white magic Dia III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.DIA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.DIA_III)
end

return itemObject
