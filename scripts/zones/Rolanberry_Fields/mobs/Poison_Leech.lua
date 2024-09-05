-----------------------------------
-- Area: Rolanberry Fields
--  Mob: Poison Leech
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 85, 2, xi.regime.type.FIELDS)
end

return entity
