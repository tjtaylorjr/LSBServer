-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Skinnymajinx
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 654, 2, xi.regime.type.GROUNDS)
end

return entity
