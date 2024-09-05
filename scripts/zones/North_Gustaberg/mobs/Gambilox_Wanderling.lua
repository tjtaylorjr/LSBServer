-----------------------------------
-- Area: North Gustaberg
--  Mob: Gambilox Wanderling
-- Quest NM - "As Thick as Thieves"
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
