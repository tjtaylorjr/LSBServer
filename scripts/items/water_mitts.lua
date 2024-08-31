-----------------------------------
-- ID: 14992
-- Water Mitts
--  Enchantment: "Enwater"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect = xi.effect.ENWATER
    doEnspell(target, target, nil, effect)
end

return itemObject
