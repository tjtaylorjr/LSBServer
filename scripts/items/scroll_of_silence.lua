-----------------------------------
-- ID: 4667
-- Scroll of Silence
-- Teaches the white magic Silence
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SILENCE)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SILENCE)
end

return itemObject
