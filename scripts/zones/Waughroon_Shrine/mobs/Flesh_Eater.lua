-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Flesh Eater
-- BCNM: The Worm's Turn
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.CHARMABLE, 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
