-----------------------------------
-- ID: 4172
-- Item: Reraiser
-- Item Effect: +50% HP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local duration = 900
    target:delStatusEffect(xi.effect.MAX_MP_BOOST)
    target:addStatusEffect(xi.effect.MAX_MP_BOOST, 50, 0, duration)
end

return itemObject
