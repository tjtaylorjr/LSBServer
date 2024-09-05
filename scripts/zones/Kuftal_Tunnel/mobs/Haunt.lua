-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Haunt
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 736, 2, xi.regime.type.GROUNDS)
end

return entity
