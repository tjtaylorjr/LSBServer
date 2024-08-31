-----------------------------------
-- ID: 4857
-- Scroll of Blaze Spikes
-- Teaches the black magic Blaze Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.BLAZE_SPIKES)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.BLAZE_SPIKES)
end

return itemObject
