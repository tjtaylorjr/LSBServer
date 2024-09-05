-----------------------------------
-- Area: South Gustaberg
--  Mob: Vulture
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 78, 1, xi.regime.type.FIELDS)
end

return entity
