-----------------------------------
-- Area: Promyvion - Vahzl
--   NM: Solicitor
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 240)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
