-----------------------------------
-- Area: The Eldieme Necropolis [S]
--   NM: Ethniu
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 497)
end

return entity
