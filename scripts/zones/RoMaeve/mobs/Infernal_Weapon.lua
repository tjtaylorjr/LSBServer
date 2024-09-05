-----------------------------------
-- Area: RoMaeve
--  Mob: Infernal Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 123, 1, xi.regime.type.FIELDS)
end

return entity
