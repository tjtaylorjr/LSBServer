-----------------------------------
-- Area: Pashhow Marshlands
--  Mob: Gadfly
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 21, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 22, 2, xi.regime.type.FIELDS)
end

return entity
