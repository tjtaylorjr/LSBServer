-----------------------------------
-- ID: 14987
-- Thunder Mittens
--  Enchantment: "Enthunder"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect = xi.effect.ENTHUNDER
    doEnspell(target, target, nil, effect)
end

return itemObject
