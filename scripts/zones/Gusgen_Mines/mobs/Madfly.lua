-----------------------------------
-- Area: Gusgen Mines
--  Mob: Madfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 686, 2, xi.regime.type.GROUNDS)
end

return entity
