-----------------------------------
-- ID: 4702
-- Scroll of Sacrifice
-- Teaches the white magic Sacrifice
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SACRIFICE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SACRIFICE)
end

return itemObject
