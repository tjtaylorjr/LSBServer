-----------------------------------
-- ID: 18755
-- Item: Noble Himantes
-- Item Effect: TP +100
-- Durration: Instant
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addTP(100)
end

return itemObject
