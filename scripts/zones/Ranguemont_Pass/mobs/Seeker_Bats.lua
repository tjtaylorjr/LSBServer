-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Seeker Bats
-- Note: PH for Gloom Eye
-----------------------------------
local ID = zones[xi.zone.RANGUEMONT_PASS]
-----------------------------------
---@type TMobEntity
local entity = {}

local gloomEyePHTable =
{
    [ID.mob.GLOOM_EYE - 4] = ID.mob.GLOOM_EYE,
}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 603, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, gloomEyePHTable, 10, 3600) -- 1 hour
end

return entity
