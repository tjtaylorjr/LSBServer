-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Hawker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 764, 1, xi.regime.type.GROUNDS)
end

return entity
