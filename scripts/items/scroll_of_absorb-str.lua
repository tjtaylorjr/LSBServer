-----------------------------------
-- ID: 4874
-- Scroll of Absorb-STR
-- Teaches the black magic Absorb-STR
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ABSORB_STR)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ABSORB_STR)
end

return itemObject
