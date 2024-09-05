-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Savanna Rarab
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 27, 1, xi.regime.type.FIELDS)
end

return entity
