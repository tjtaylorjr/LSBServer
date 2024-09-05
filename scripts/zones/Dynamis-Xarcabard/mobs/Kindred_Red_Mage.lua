-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Kindred Red Mage
-----------------------------------
mixins =
{
    require('scripts/mixins/dynamis_beastmen'),
    require('scripts/mixins/job_special')
}
local ID = zones[xi.zone.DYNAMIS_XARCABARD]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ID.mob.DUKE_BERITH_PH, 10, 1200) -- 20 minutes
end

return entity
