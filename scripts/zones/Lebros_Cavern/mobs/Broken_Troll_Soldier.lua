-----------------------------------
-- Area: Lebros Cavern (Troll Fugitives)
--  Mob: Broken Troll Soldier
-- Todo: make them spawn at 25-75% hp and stay
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    local maxHP = mob:getHP()
    local bonus = math.random(2, 6)
    mob:setHP(maxHP / (8 / bonus))
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    local instance = mob:getInstance()

    if not instance then
        return
    end

    instance:setProgress(instance:getProgress() + 1)
end

return entity
