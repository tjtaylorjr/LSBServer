-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Neman
-- BCNM: Birds of a Feather
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(xi.mod.SLEEP_MEVA, 50)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.CHARMABLE, 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
