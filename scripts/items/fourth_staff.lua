-----------------------------------
-- ID: 18613
-- Fourth Staff
-- Enchantment: "Retrace" (Bastok Markets[S])
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.BASTOK_MARKETS_S, 0, 3)
end

return itemObject
