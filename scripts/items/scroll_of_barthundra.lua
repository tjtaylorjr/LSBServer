-----------------------------------
-- ID: 4678
-- Scroll of Barthundra
-- Teaches the white magic Barthundra
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BARTHUNDRA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BARTHUNDRA)
end

return itemObject
