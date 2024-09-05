-----------------------------------
-- Area: Giddeus (145)
--   NM: Quu Xijo the Illusory
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 283)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(3600, 4200)) -- 60 to 70 minutes
end

return entity
