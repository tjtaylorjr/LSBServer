-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Skinnymalinks
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 653, 2, xi.regime.type.GROUNDS)
end

return entity
