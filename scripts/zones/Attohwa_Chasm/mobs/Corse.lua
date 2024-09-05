-----------------------------------
-- Area: Attohwa Chasm
--  Mob: Corse
-- Note: PH for Citipati
-----------------------------------
local ID = zones[xi.zone.ATTOHWA_CHASM]
-----------------------------------
---@type TMobEntity
local entity = {}

local citipatiPHTable =
{
    [ID.mob.CITIPATI - 7] = ID.mob.CITIPATI, -- -328.973 -12.876 67.481
    [ID.mob.CITIPATI - 4] = ID.mob.CITIPATI, -- -398.931 -4.536 79.640
    [ID.mob.CITIPATI - 1] = ID.mob.CITIPATI, -- -381.284 -9.233 40.054
}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    local params = {}
    params.nightOnly = true
    xi.mob.phOnDespawn(mob, citipatiPHTable, 20, math.random(10800, 21600), params) -- 3 to 6 hours, night only
end

return entity
