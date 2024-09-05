-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Thread Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 57, 1, xi.regime.type.FIELDS)
end

return entity
