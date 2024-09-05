-----------------------------------
-- Area: Gustav Tunnel
--  Mob: Doom Soldier
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 765, 2, xi.regime.type.GROUNDS)
end

return entity
