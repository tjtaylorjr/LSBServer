-----------------------------------
-- ID: 5847
-- Item: pinch_of_fanatics_powder
-- Item Effect: When applied, grants UDMGPHYS -10000 to party members in range for 60s
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect        = xi.effect.PHYSICAL_SHIELD
    local duration      = 60
    local power         = 1
    local mitigatews    = 1

    target:forMembersInRange(20, function(member)
        xi.itemUtils.addItemShield(member, power, duration, effect, mitigatews)
    end)
end

return itemObject
