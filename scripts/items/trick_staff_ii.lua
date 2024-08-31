-----------------------------------
--  ID: 17587
--  Trick Staff II
--  Transports the user to their Home Point
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:warp()
end

return itemObject
