-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Goblin Alchemist
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 740, 2, xi.regime.type.GROUNDS)
end

return entity
