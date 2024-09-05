-----------------------------------
-- Area: Garlaige Citadel
--  Mob: Wingrats
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 703, 1, xi.regime.type.GROUNDS)
end

return entity
