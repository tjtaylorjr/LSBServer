-----------------------------------
-- Area: South Gustaberg
--  Mob: Goblin Weaver
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 79, 1, xi.regime.type.FIELDS)
end

return entity
