-----------------------------------
-- Area: Batallia Downs [S]
--  Mob: Lycopodium
-----------------------------------
mixins = { require('scripts/mixins/families/lycopodium') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ALWAYS_AGGRO, 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
