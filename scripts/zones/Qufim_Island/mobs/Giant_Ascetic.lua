-----------------------------------
-- Area: Qufim Island
--  Mob: Giant Ascetic
-- Note: PH for Slippery Sucker
-----------------------------------
local ID = zones[xi.zone.QUFIM_ISLAND]
-----------------------------------
---@type TMobEntity
local entity = {}

local slipperyPHTable =
{
    [ID.mob.SLIPPERY_SUCKER - 12] = ID.mob.SLIPPERY_SUCKER, -- ascet
}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 44, 1, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 45, 2, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, slipperyPHTable, 10, 600) -- 10 minutes
end

return entity
