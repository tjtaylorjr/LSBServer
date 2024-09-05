-----------------------------------
-- Area: La Theine Plateau
--  Mob: Huge Wasp
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 5, 2, xi.regime.type.FIELDS)
    xi.tutorial.onMobDeath(player)
end

return entity
