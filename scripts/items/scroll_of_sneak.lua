-----------------------------------
-- ID: 4745
-- Scroll of Sneak
-- Teaches the white magic Sneak
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SNEAK)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SNEAK)
end

return itemObject
