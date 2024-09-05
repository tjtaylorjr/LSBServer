-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Silver Quadav
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 87, 2, xi.regime.type.FIELDS)
end

return entity
