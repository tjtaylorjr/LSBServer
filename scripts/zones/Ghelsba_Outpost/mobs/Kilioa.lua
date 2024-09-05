-----------------------------------
-- Area: Ghelsba Outpost
--  Mob: Kilioa
-- BCNM: Petrifying Pair
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.SLEEP_MEVA, 100)
    mob:setMod(xi.mod.LULLABY_MEVA, 100)
    mob:setMobMod(xi.mobMod.NO_MOVE, 1) -- lock from moving
    mob:setMobMod(xi.mobMod.SUPERLINK, 1)
end

entity.onMobEngage = function(mob, target)
    mob:setMobMod(xi.mobMod.NO_MOVE, 0) -- unlock mob
    mob:useMobAbility(373) -- secretion
end

entity.onMobWeaponSkill = function(mob, target, skill)
    if math.random() < 0.5 then
        return 370 -- favor baleful gaze
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
