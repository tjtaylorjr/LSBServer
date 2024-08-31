-----------------------------------
-- func: spawnmob
-- desc: Spawns a mob.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'iii'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!spawnmob <mob ID> (despawntime) (respawntime)')
end

commandObj.onTrigger = function(player, mobId, despawntime, respawntime)
    local zone = player:getZone()
    if not zone then
        return
    end

    if zone:getTypeMask() == xi.zoneType.INSTANCED then
        local instance = player:getInstance()

        -- validate mobId
        if mobId == nil then
            error(player, 'You must provide a mob ID.')
            return
        end

        if GetMobByID(mobId, instance) == nil then
            error(player, 'Invalid mobID')
            return
        end

        if GetMobByID(mobId, instance):isSpawned() then
            error(player, 'Mob is already spawned')
            return
        end

        SpawnMob(mobId, instance)
        player:printToPlayer(string.format('Spawned %s %s in %s.', GetMobByID(mobId, instance):getName(), mobId, instance))
    else
        -- validate mobId
        if mobId == nil then
            error(player, 'You must provide a mob ID.')
            return
        end

        local targ = GetMobByID(mobId)
        if targ == nil then
            error(player, 'Invalid mob ID.')
            return
        end

        if targ:isSpawned() then
            error(player, 'Mob is already spawned')
            return
        end

        -- validate despawntime
        if despawntime ~= nil and despawntime < 0 then
            error(player, 'Invalid despawn time.')
            return
        end

        -- validate respawntime
        if respawntime ~= nil and respawntime < 0 then
            error(player, 'Invalid respawn time.')
            return
        end

        SpawnMob(targ:getID(), despawntime, respawntime)
        player:printToPlayer(string.format('Spawned %s %s.', targ:getName(), mobId))
    end
end

return commandObj
