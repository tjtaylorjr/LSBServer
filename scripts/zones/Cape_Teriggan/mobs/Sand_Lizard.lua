-----------------------------------
-- Area: Cape Teriggan
--  Mob: Sand Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 104, 2, xi.regime.type.FIELDS)
end

return entity
