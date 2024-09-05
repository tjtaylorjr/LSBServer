-----------------------------------
-- Area: Riverne - Site A01
--  Mob: Hippogryph
-- Note: PH for Heliodromos
-----------------------------------
local ID = zones[xi.zone.RIVERNE_SITE_A01]
-----------------------------------
---@type TMobEntity
local entity = {}

local function disturbMob(mob)
    local offset = mob:getID() - ID.mob.HELIODROMOS_OFFSET - 3
    if offset >= 0 and offset <= 2 then
        SetServerVariable('Heliodromos_ToD', os.time() + math.random(43200, 54000)) -- 12 to 15 hours
    end
end

entity.onMobSpawn = function(mob)
    disturbMob(mob)
end

entity.onMobEngage = function(mob, target)
    disturbMob(mob)
end

entity.onMobFight = function(mob, target)
    disturbMob(mob)
end

entity.onMobRoam = function(mob)
    -- no PH has been disturbed for 12-15 hours
    if os.time() > GetServerVariable('Heliodromos_ToD') then
        local noHeliodromosSpawned = true
        for i = ID.mob.HELIODROMOS_OFFSET, ID.mob.HELIODROMOS_OFFSET + 2 do
            if GetMobByID(i):isSpawned() then
                noHeliodromosSpawned = false
            end
        end

        if noHeliodromosSpawned then
            -- despawn placeholders
            for i = ID.mob.HELIODROMOS_OFFSET - 3, ID.mob.HELIODROMOS_OFFSET - 1 do
                DisallowRespawn(i, true)
                DespawnMob(i)
            end

            -- spawn heliodromos
            for i = ID.mob.HELIODROMOS_OFFSET, ID.mob.HELIODROMOS_OFFSET + 2 do
                SpawnMob(i)
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
