-----------------------------------
-- Area: West Ronfaure
--  Mob: Marauder Dvogzog
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 4, 1, xi.regime.type.FIELDS)
end

return entity
