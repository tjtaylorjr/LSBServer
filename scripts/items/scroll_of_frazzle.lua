-----------------------------------
-- ID: 4914
-- Scroll of Frazzle
-- Teaches the black magic Frazzle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FRAZZLE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FRAZZLE)
end

return itemObject
