-----------------------------------
-- Area: East Ronfaure [S]
--   NM: Melusine
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 482)
end

entity.onMobDespawn = function(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(7200 + math.random(0, 10) * 60)
end

return entity
