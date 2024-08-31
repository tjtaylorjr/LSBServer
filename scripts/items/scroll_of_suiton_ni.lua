-----------------------------------
-- ID: 4944
-- Scroll of Suiton: Ni
-- Teaches the ninjutsu Suiton: Ni
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SUITON_NI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SUITON_NI)
end

return itemObject
