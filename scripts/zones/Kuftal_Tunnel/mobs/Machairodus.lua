-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Machairodus
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 742, 2, xi.regime.type.GROUNDS)
end

return entity
