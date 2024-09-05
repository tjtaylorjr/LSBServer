-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Four of Batons
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.amk.helpers.cardianOrbDrop(mob, player, xi.ki.ORB_OF_BATONS)
    xi.regime.checkRegime(player, mob, 663, 2, xi.regime.type.GROUNDS)
end

return entity
