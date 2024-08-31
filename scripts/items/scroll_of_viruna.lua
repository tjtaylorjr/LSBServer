-----------------------------------
-- ID: 4627
-- Scroll of Viruna
-- Teaches the white magic Viruna
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.VIRUNA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.VIRUNA)
end

return itemObject
