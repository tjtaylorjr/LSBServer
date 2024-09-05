-----------------------------------
-- Area: Sacrarium
--   NM: Keremet
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobFight = function(mob, target)
    local keremet = mob:getID()

    -- Send spawned skeleton "pets" to Keremet's target
    for i = keremet + 1, keremet + 12 do
        local m = GetMobByID(i)

        if m and m:getCurrentAction() == xi.act.ROAMING then
            m:updateEnmity(target)
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
    mob:setRespawnTime(math.random(1200, 1800)) -- 20 to 30 minutes
end

return entity
