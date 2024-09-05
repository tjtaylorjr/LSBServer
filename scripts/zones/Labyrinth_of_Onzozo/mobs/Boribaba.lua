-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Boribaba
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 776, 2, xi.regime.type.GROUNDS)
end

return entity
