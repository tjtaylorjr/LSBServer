-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Snipper
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 8, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 9, 2, xi.regime.type.FIELDS)
end

return entity
