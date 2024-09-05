-----------------------------------
-- Area: North Gustaberg
--  Mob: Stone Eater
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 16, 1, xi.regime.type.FIELDS)
end

return entity
