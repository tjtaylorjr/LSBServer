-----------------------------------
-- Area: Dangruf Wadi
--  Mob: Fume Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 642, 1, xi.regime.type.GROUNDS)
end

return entity
