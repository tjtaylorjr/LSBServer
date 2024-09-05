-----------------------------------
-- Area: La Theine Plateau
--  Mob: Nihniknoovi
-----------------------------------
require('scripts/quests/tutorial')
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 600)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 153)
    xi.tutorial.onMobDeath(player)
end

return entity
