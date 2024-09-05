-----------------------------------
-- Area: The Ashu Talif (The Black Coffin)
--  Mob: Ashu Talif Crew
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    local allies = mob:getInstance():getAllies()
    for i, v in pairs(allies) do
        if v:isAlive() then
            v:setLocalVar('ready', 1)
        end
    end

    local mobs = mob:getInstance():getMobs()
    for i, v in pairs(mobs) do
        if v:isAlive() then
            v:setLocalVar('ready', 1)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    local instance = mob:getInstance()
    if instance then
        instance:setProgress(instance:getProgress() + 1)
    end
end

return entity
