-----------------------------------
-- Area: QuBia_Arena
--  Mob: Warlord Rojgnoj
-- Mission 9-2 San d'Oria
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(xi.mod.SLEEP_MEVA, 50)
end

entity.onMobSpawn = function(mob)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
