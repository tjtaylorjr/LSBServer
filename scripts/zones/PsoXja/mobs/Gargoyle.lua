-----------------------------------
-- Area: Pso'Xja
--  Mob: Gargoyle
-----------------------------------
local ID = zones[xi.zone.PSOXJA]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 120)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        local mobId = mob:getID()
        local offset = mobId - ID.mob.GARGOYLE_OFFSET
        if offset < 16 then
            GetNPCByID(ID.npc.STONE_DOOR_OFFSET + offset):openDoor(30)
        end
    end
end

entity.onMobDespawn = function(mob)
end

return entity
