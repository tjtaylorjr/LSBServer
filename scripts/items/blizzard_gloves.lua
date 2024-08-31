-----------------------------------
-- ID: 14990
-- Blizzard Gloves
--  Enchantment: "Enblizzard"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect = xi.effect.ENBLIZZARD
    doEnspell(target, target, nil, effect)
end

return itemObject
