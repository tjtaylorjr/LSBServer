-----------------------------------
-- Area: Sea Serpent Grotto
--  Mob: Mindgazer
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 811, 1, xi.regime.type.GROUNDS)
end

return entity
