-----------------------------------
-- ID: 4856
-- Scroll of Aspir II
-- Teaches the black magic Aspir II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ASPIR_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ASPIR_II)
end

return itemObject
