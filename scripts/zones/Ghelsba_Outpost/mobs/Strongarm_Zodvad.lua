-----------------------------------
-- Area: Ghelsba Outpost
--   NM: Strongarm Zodvad
-- Involved in Mission: Save the Children
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.GIL_MAX, -1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
