-----------------------------------
-- ID: Unknown
-- Scroll of Addle
-- Teaches the magic Addle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.ADDLE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.ADDLE)
end

return itemObject
