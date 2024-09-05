-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Goblin Ambusher
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 695, 1, xi.regime.type.GROUNDS)
end

return entity
