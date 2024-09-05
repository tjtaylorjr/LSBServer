-----------------------------------
-- Area: Leujaoam Sanctum (Leujaoam Cleansing)
--  Mob: Leujaoam Worm
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.assault.adjustMobLevel(mob)
    mob:setMod(xi.mod.UDMGMAGIC, -50)
    mob:addMod(xi.mod.DEF, 100)
end

entity.onMobDeath = function(mob, player, optParams)
    local instance = mob:getInstance()

    if not instance then
        return
    end

    if mob:getLocalVar('Killed') == 0 then
        instance:setProgress(instance:getProgress() + 1)
        mob:setLocalVar('Killed', 1)
    end
end

entity.onMobDespawn = function(mob)
end

return entity
