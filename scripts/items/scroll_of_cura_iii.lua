-----------------------------------
-- ID: 5083
-- Scroll of Cura III
-- Teaches the white magic Cura III
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.CURA_III)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.CURA_III)
end

return itemObject
