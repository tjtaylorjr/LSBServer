-----------------------------------
-- Area: Dynamis - San d'Oria
--  Mob: Overlord's Tombstone
-- Note: Mega Boss
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    local mobId = mob:getID()
    for i = mobId + 1, mobId + 2 do
        if not GetMobByID(i):isSpawned() then
            SpawnMob(i):updateEnmity(target)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
    xi.dynamis.megaBossOnDeath(mob, player, optParams)

    if optParams.isKiller then
        local mobId = mob:getID()
        for i = mobId + 1, mobId + 2 do
            if GetMobByID(i):isSpawned() then
                DespawnMob(i)
            end
        end
    end

    xi.magian.onMobDeath(mob, player, optParams, set{ 4402 })
end

return entity
