-----------------------------------
-- ID: 4962
-- Scroll of Tonko: Ichi
-- Teaches the ninjutsu Tonko: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.TONKO_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.TONKO_NI)
end

return itemObject
