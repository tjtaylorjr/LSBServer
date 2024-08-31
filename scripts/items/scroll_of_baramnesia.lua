-----------------------------------
-- ID: 4690
-- Scroll of Baramnesia
-- Teaches the white magic Baramnesia
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BARAMNESIA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BARAMNESIA)
end

return itemObject
