-----------------------------------
-- Area: Fei'Yin
--  Mob: Vampire Bat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 711, 1, xi.regime.type.GROUNDS)
end

return entity
