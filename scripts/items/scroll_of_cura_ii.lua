-----------------------------------
-- ID: 5082
-- Scroll of Cura II
-- Teaches the white magic Cura II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURA_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURA_II)
end

return itemObject
