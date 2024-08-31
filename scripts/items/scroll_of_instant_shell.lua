-----------------------------------
-- ID: 5989
--  Scroll of Instant Shell
--  Grants the effect of Shell
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local power = 1900 -- shell_iii base power
    local duration = 1800

    target:addStatusEffect(xi.effect.SHELL, power, duration)
end

return itemObject
