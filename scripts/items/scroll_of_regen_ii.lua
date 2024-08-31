-----------------------------------
-- ID: 4718
-- Scroll of Regen II
-- Teaches the white magic Regen II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.REGEN_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.REGEN_II)
end

return itemObject
