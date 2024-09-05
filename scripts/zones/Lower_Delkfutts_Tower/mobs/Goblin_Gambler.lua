-----------------------------------
-- Area: Lower Delkfutt's Tower
--  Mob: Goblin Gambler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 777, 2, xi.regime.type.GROUNDS)
end

return entity
