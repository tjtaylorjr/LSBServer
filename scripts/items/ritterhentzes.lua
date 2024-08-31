-----------------------------------
-- ID: 15652
-- Item: ritter
-- Item Effect: Blaze Spikes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.BLAZE_SPIKES, 20, 0, 210)
end

return itemObject
