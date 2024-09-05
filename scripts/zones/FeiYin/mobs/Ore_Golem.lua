-----------------------------------
-- Area: FeiYin
--  Mob: Ore Golem
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 712, 2, xi.regime.type.GROUNDS)
end

return entity
