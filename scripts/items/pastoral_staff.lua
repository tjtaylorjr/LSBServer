-----------------------------------
-- ID: 18591
-- Item: Pastoral Staff
-- Item Effect: TP +100
-- Duration: Instant
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addTP(1000)
end

return itemObject
