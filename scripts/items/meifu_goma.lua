-----------------------------------
-- ID: 4185
-- Meifu Goma
-- A spinning firework appears on the ground and sprays sparks in a circle
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
end

return itemObject
