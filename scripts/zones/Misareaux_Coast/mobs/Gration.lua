-----------------------------------
-- Area: Misareaux Coast
--   NM: Gration
-----------------------------------
mixins = { require('scripts/mixins/fomor_hate') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 900)
end

entity.onMobSpawn = function(mob)
    mob:addStatusEffect(xi.effect.KILLER_INSTINCT, 40, 0, 0)
    mob:setLocalVar('fomorHateAdj', 2)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
