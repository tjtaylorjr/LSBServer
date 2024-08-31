-----------------------------------
-- ID: 4816
-- Scroll of Tornado
-- Teaches the black magic Tornado
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.TORNADO)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.TORNADO)
end

return itemObject
