-----------------------------------
-- ID: 5243
-- Item: container_of_carnal_incense
-- Item Effect: When applied, grants UDMGPHYS -10000 for 20s
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect        = xi.effect.PHYSICAL_SHIELD
    local duration      = 20
    local power         = 1
    local mitigatews    = 2

    xi.itemUtils.addItemShield(target, power, duration, effect, mitigatews)
end

return itemObject
