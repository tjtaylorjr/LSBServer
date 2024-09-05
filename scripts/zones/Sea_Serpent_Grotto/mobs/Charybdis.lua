-----------------------------------
-- Area: Sea Serpent Grotto (176)
--   NM: Charybdis
-- !pos -152 48 -328 176
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.MULTI_HIT, 5)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
