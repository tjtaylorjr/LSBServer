-----------------------------------
-- Area: Yhoator Jungle
--  Mob: White Lizard
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 129, 1, xi.regime.type.FIELDS)
end

return entity
