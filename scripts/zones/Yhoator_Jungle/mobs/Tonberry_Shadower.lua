-----------------------------------
-- Area: Yhoator Jungle
--  Mob: Tonberry Shadower
-- Note: PH for Hoar-knuckled Rimberry
-----------------------------------
local ID = zones[xi.zone.YHOATOR_JUNGLE]
mixins = { require('scripts/mixins/families/tonberry') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 133, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.HOAR_KNUCKLED_RIMBERRY_PH, 10, math.random(5400, 7200)) -- 90 to 120 minutes
end

return entity
