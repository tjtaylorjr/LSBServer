-----------------------------------
-- ID: 4215
-- Popstar
-- A yellow star rises and bursts in the air
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
end

return itemObject
