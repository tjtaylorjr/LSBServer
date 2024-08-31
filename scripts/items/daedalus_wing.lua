-----------------------------------
-- ID: 4202
-- Daedalus Wing
-- Increases TP of the user by 1000
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
