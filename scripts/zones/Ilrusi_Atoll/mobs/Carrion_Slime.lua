-----------------------------------
-- Area: Ilrusi Atoll (Extermination)
--  Mob: Carrion Slime
-----------------------------------
local ID = zones[xi.zone.ILRUSI_ATOLL]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    local instance = mob:getInstance()

    if not instance then
        return
    end

    local slimeMob = GetMobByID(ID.mob.UNDEAD_SLIME, instance)
    local randVal  = math.random(1, 5)

    if
        randVal == 1 and
        slimeMob and
        slimeMob:getLocalVar('SlimeSpawned') == 0
    then
        SpawnMob(ID.mob.UNDEAD_SLIME, instance)
        slimeMob:setLocalVar('SlimeSpawned', 1)
    else
        instance:setProgress(instance:getProgress() + 1)
    end
end

return entity
