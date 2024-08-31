-----------------------------------
-- ID: 4729
-- Scroll of Teleport-Altep
-- Teaches the white magic Teleport-Altep
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.TELEPORT_ALTEP)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.TELEPORT_ALTEP)
end

return itemObject
