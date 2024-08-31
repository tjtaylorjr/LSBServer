-----------------------------------
-- ID: 14672
-- Tavnazian Ring
-- Enchantment: "Teleport-Tavnazia"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:setPos(0, -23.5, 29.15, 63, 26)
end

return itemObject
