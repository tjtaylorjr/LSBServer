-----------------------------------
-- ID: 5016
-- Scroll of Shining Fantasia
-- Teaches the song Shining Fantasia
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SHINING_FANTASIA)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SHINING_FANTASIA)
end

return itemObject
