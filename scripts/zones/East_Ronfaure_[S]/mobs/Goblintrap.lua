-----------------------------------
-- Area: East Ronfaure [S]
--  Mob: Goblintrap
-- Note: Goblintrap NM
-- !pos 168 0 -440 81
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 481)
end

return entity
