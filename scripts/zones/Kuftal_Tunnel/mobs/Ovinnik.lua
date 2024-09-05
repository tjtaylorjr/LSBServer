-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Ovinnik
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 741, 1, xi.regime.type.GROUNDS)
end

return entity
