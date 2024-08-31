-----------------------------------
-- ID: 4710
-- Scroll of Enaero
-- Teaches the white magic Enaero
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ENAERO)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ENAERO)
end

return itemObject
