-----------------------------------
-- Area: Cape Teriggan
--   NM: Axesarion the Wanderer
-----------------------------------
local ID = zones[xi.zone.CAPE_TERIGGAN]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDisengage = function(mob)
    DespawnMob(mob:getID(), 120)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        GetNPCByID(ID.npc.CERMET_HEADSTONE):setLocalVar('cooldown', os.time() + 900)
    end
end

return entity
