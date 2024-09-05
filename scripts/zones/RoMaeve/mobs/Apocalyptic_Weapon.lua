-----------------------------------
-- Area: RoMaeve
--  Mob: Apocalyptic Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 122, 1, xi.regime.type.FIELDS)
end

return entity
