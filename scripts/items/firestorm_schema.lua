-----------------------------------
-- ID: 6049
-- Firestorm Schema
-- Teaches the white magic Firestorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FIRESTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FIRESTORM)
end

return itemObject
