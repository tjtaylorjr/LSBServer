-----------------------------------
-- ID: 6051
-- Thunderstorm Schema
-- Teaches the white magic Thunderstorm
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.THUNDERSTORM)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.THUNDERSTORM)
end

return itemObject
