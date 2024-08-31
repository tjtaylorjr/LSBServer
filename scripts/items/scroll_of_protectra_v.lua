-----------------------------------
-- ID: 4737
-- Scroll of Protectra V
-- Teaches the white magic Protectra V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.PROTECTRA_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.PROTECTRA_V)
end

return itemObject
