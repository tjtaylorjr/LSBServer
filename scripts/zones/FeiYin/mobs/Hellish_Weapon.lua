-----------------------------------
-- Area: Fei'Yin
--  Mob: Hellish Weapon
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 716, 2, xi.regime.type.GROUNDS)
end

return entity
