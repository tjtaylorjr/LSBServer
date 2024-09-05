-----------------------------------
-- Area: Labyrinth of Onzozo
--  Mob: Mushussu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 773, 1, xi.regime.type.GROUNDS)
end

return entity
