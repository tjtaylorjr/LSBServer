-----------------------------------
-- Area: Garlaige Citadel
--   NM: Hazmat
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 300)
end

return entity
