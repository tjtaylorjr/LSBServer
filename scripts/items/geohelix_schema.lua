-----------------------------------
-- ID: 6045
-- Geohelix Schema
-- Teaches the black magic Geohelix
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.GEOHELIX)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.GEOHELIX)
end

return itemObject
