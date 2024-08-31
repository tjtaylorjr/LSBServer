-----------------------------------
--  ID: 15698
--  Sneaking Boots
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:delStatusEffect(xi.effect.SNEAK)
    target:addStatusEffect(xi.effect.SNEAK, 1, 0, math.floor(180 * xi.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER))
end

return itemObject
