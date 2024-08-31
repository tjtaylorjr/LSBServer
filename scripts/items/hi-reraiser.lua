-----------------------------------
-- ID: 4173
-- Item: Hi-Reraiser
-- Item Effect: This potion functions inthe same way as the spell Reraise II.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 5400
    target:delStatusEffect(xi.effect.RERAISE)
    target:addStatusEffect(xi.effect.RERAISE, 2, 0, duration)
end

return itemObject
