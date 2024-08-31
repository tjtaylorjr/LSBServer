-----------------------------------
-- Area: Buburimu Peninsula (118)
--   NM: Backoo
-- Note: Spawns only from hours 06 to 16.
-----------------------------------
local ID = zones[xi.zone.BUBURIMU_PENINSULA]
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.SLOW)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 263)
end

entity.onMobDespawn = function(mob)
    GetMobByID(ID.mob.BACKOO):setRespawnTime(math.random(3600, 5400)) -- 60-90 minute respawn, depending on if it's daytime
end

return entity
