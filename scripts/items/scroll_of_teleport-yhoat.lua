-----------------------------------
-- ID: 4728
-- Scroll of Teleport-Yhoat
-- Teaches the white magic Teleport-Yhoat
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.TELEPORT_YHOAT)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.TELEPORT_YHOAT)
end

return itemObject
