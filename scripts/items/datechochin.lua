-----------------------------------
-- ID: 5361
-- Datechochin
-- Turns the user into a floating yellow lantern
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
end

return itemObject
