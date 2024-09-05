-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Executioner Antlion
-----------------------------------
mixins = { require('scripts/mixins/families/antlion_ambush_noaggro') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 120)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
