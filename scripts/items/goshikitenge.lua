-----------------------------------
-- ID: 5725
-- Goshikitenge
-- A launcher appears on the ground and fires 2 volleys of airbursts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
end

return itemObject
