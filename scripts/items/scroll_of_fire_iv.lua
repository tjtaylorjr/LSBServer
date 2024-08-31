-----------------------------------
-- ID: 4755
-- Scroll of Fire IV
-- Teaches the black magic Fire IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.FIRE_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.FIRE_IV)
end

return itemObject
