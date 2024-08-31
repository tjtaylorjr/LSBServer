-----------------------------------
-- ID: 17957
-- Item: Navy Axe
-- Item Effect: TP +1000
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
