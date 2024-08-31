-----------------------------------
--  ID: 16118
--  Moogle Cap
--  Transports the user to their Home Nation
-----------------------------------
require('scripts/globals/teleports')
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.HOME_NATION, 0, 4)
end

return itemObject
