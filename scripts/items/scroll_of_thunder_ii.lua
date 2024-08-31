-----------------------------------
-- ID: 4773
-- Scroll of Thunder II
-- Teaches the black magic Thunder II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.THUNDER_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.THUNDER_II)
end

return itemObject
