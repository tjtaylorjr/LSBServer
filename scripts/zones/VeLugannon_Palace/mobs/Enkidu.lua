-----------------------------------
-- Area: Ve'Lugannon Palace
--  Mob: Enkidu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 743, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 747, 1, xi.regime.type.GROUNDS)
end

return entity
