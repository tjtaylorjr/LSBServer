-----------------------------------
-- Area: The Sanctuary of Zi'Tah (121)
--   NM: Greenman
-- Note: Popped by qm1
-- Involved in Quest: The Weight Of Your Limits
-- !pos -325.406 -0.198 471.459 121
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.EXP_BONUS, -100)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
