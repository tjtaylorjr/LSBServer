-----------------------------------
-- Area: West Sarutabaruta
--  Mob: Bakru
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 26, 1, xi.regime.type.FIELDS)
end

return entity
