-----------------------------------
-- Area: King Ranperres Tomb
--   NM: Ankou
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 176)
end

return entity
