-----------------------------------
-- ID: 4692
-- Scroll of Haste II
-- Teaches the white magic Haste II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HASTE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HASTE_II)
end

return itemObject
