-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Shrieker
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 656, 2, xi.regime.type.GROUNDS)
end

return entity
