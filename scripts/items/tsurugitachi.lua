-----------------------------------
-- ID: 18444
-- Item: Tsurugitachi
-- Item Effect: TP +10
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
