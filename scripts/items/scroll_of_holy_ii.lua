-----------------------------------
-- ID: 4629
-- Scroll of Holy II
-- Teaches the white magic Holy II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HOLY_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HOLY_II)
end

return itemObject
