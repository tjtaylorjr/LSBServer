-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Goblin Lurcher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 654, 1, xi.regime.type.GROUNDS)
end

return entity
