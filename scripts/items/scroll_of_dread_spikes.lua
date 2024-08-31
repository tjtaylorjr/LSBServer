-----------------------------------
-- ID: 4885
-- Scroll of Dread Spikes
-- Teaches the black magic Dread Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.DREAD_SPIKES)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.DREAD_SPIKES)
end

return itemObject
