-----------------------------------
-- Area: The Boyahda Tree
--  Mob: Death Cap
-- Note: PH for Ellyllon
-----------------------------------
local ID = zones[xi.zone.THE_BOYAHDA_TREE]
-----------------------------------
---@type TMobEntity
local entity = {}

local ellyllonPHTable =
{
    [ID.mob.ELLYLLON - 1] = ID.mob.ELLYLLON, -- 192.54 8.532 -163.41
}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 719, 1, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, ellyllonPHTable, 10, math.random(7200, 10800)) -- 2 to 3 hours
end

return entity
