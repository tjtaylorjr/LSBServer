-----------------------------------
-- ID: 4170
-- Wedding Bell
-- These bells are used in most Vana'diel weddings.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
end

return itemObject
