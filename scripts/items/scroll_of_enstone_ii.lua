-----------------------------------
-- ID: 4725
-- Scroll of Enstone II
-- Teaches the white magic Enstone II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ENSTONE_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ENSTONE_II)
end

return itemObject
