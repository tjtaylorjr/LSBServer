-----------------------------------
-- ID: 4150
-- Item: Eye Drops
-- Item Effect: This potion remedies blindness.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.BLINDNESS) then
        target:delStatusEffect(xi.effect.BLINDNESS)
    end
end

return itemObject
