-----------------------------------
-- Area: Den of Rancor
--  Mob: Tonberry Slasher
-- Note: PH for Tawny-fingered Mugberry
-----------------------------------
mixins = { require('scripts/mixins/families/tonberry') }
local ID = zones[xi.zone.DEN_OF_RANCOR]
-----------------------------------
---@type TMobEntity
local entity = {}

local tawnyPHTable =
{
    [ID.mob.TAWNY_FINGERED_MUGBERRY - 14] = ID.mob.TAWNY_FINGERED_MUGBERRY,
    [ID.mob.TAWNY_FINGERED_MUGBERRY - 13] = ID.mob.TAWNY_FINGERED_MUGBERRY,
    [ID.mob.TAWNY_FINGERED_MUGBERRY - 11] = ID.mob.TAWNY_FINGERED_MUGBERRY,
    [ID.mob.TAWNY_FINGERED_MUGBERRY - 10] = ID.mob.TAWNY_FINGERED_MUGBERRY,
    [ID.mob.TAWNY_FINGERED_MUGBERRY - 5]  = ID.mob.TAWNY_FINGERED_MUGBERRY,
    [ID.mob.TAWNY_FINGERED_MUGBERRY - 4]  = ID.mob.TAWNY_FINGERED_MUGBERRY,
}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 798, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 799, 2, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 800, 2, xi.regime.type.GROUNDS)
end

entity.onMobDespawn = function(mob)
    xi.mob.phOnDespawn(mob, tawnyPHTable, 5, 3600) -- 1 hour
end

return entity
