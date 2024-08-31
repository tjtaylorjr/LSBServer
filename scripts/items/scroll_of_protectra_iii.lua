-----------------------------------
-- ID: 4735
-- Scroll of Protectra III
-- Teaches the white magic Protectra III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.PROTECTRA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.PROTECTRA_III)
end

return itemObject
