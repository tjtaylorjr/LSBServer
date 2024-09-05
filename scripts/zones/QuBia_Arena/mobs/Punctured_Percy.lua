-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Punctured Percy
-- BCNM: Celery
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    local mobId = mob:getID()
    DespawnMob(mobId - 3)
    DespawnMob(mobId - 2)
    DespawnMob(mobId - 1)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
