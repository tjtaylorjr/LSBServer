-----------------------------------
-- ID: 4763
-- Scroll of Aero II
-- Teaches the black magic Aero II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.AERO_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.AERO_II)
end

return itemObject
