-----------------------------------
-- ID: 4670
-- Scroll of Baraero
-- Teaches the white magic Baraero
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BARAERO)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BARAERO)
end

return itemObject
