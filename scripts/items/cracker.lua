-----------------------------------
-- ID: 4167
-- Cracker
-- Creates a simple puff of smoke with a "crack" noise
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
end

return itemObject
