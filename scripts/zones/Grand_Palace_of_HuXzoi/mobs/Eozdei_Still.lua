-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  Mob: Eo'zdei
-----------------------------------
local ID = zones[xi.zone.GRAND_PALACE_OF_HUXZOI]
mixins = { require('scripts/mixins/families/zdei') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onPath = function(mob)
    local spawnPos = mob:getSpawnPos()
    mob:pathThrough({ spawnPos.x, spawnPos.y, spawnPos.z })
    local pos = mob:getPos()
    if spawnPos.x == pos.x and spawnPos.z == pos.z then
        mob:setPos(spawnPos.x, spawnPos.y, spawnPos.z, spawnPos.rot)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller then
        local mobId = mob:getID()
        local nm    = GetMobByID(ID.mob.JAILER_OF_TEMPERANCE)
        if not nm then
            return
        end

        local ph = nm:getLocalVar('ph')
        if ph == mobId and os.time() > nm:getLocalVar('pop') then
            local pos = mob:getSpawnPos()
            nm:setSpawn(pos.x, pos.y, pos.z)
            SpawnMob(ID.mob.JAILER_OF_TEMPERANCE):updateClaim(player)
            nm:setLocalVar('ph', ph)
            DisallowRespawn(mobId, true)
        end
    end
end

return entity
