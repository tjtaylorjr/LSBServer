-----------------------------------
-- Area: Misareaux Coast
--  Mob: Warder Euphrosyne
-----------------------------------
mixins = { require('scripts/mixins/warders_cop') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobSpawn = function(mob)
    mob:setMobAbilityEnabled(false) -- ability use handled in mixin
    mob:setLocalVar('warder', 2)
    mob:setLocalVar('electro', 1)
end

entity.onMobDisengage = function(mob)
    -- reset variables so that disengaging mobs won't break mixin
    mob:setLocalVar('changeTime', 0)
    mob:setLocalVar('initiate', 0)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
