-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Cave Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 737, 1, xi.regime.type.GROUNDS)
end

return entity
