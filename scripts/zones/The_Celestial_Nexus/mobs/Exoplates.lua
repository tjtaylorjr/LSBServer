-----------------------------------
-- Area: The Celestial Nexus
--  Mob: Exoplates
-- Zilart Mission 16 BCNM Fight
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(xi.mod.REGAIN, 50)
end

entity.onMobSpawn = function(mob)
    mob:setAnimationSub(0)
    mob:setAutoAttackEnabled(false)
    mob:setUnkillable(true)
end

entity.onMobFight = function(mob, target)
    local shifts = mob:getLocalVar('shifts')
    local shiftTime = mob:getLocalVar('shiftTime')

    if mob:getAnimationSub() == 0 and shifts == 0 and mob:getHPP() <= 67 then
        mob:useMobAbility(993)
        mob:setLocalVar('shifts', shifts + 1)
        mob:setLocalVar('shiftTime', mob:getBattleTime() + 5)
    elseif mob:getAnimationSub() == 1 and shifts <= 1 and mob:getHPP() <= 33 then
        mob:useMobAbility(997)
        mob:setLocalVar('shifts', shifts + 1)
        mob:setLocalVar('shiftTime', mob:getBattleTime() + 5)
    elseif mob:getAnimationSub() == 2 and shifts <= 2 and mob:getHPP() <= 2 then
        mob:useMobAbility(1001)
        mob:setLocalVar('shifts', shifts + 1)
        mob:setLocalVar('shiftTime', mob:getBattleTime() + 5)
    elseif
        mob:getHPP() <= 67 and
        mob:getAnimationSub() == 0 and
        mob:getBattleTime() >= shiftTime
    then
        mob:setAnimationSub(1)
    elseif
        mob:getHPP() <= 33 and
        mob:getAnimationSub() == 1 and
        mob:getBattleTime() >= shiftTime
    then
        mob:setAnimationSub(2)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    local ealdnarche = GetMobByID(mob:getID() - 1)

    if ealdnarche then
        ealdnarche:delStatusEffect(xi.effect.PHYSICAL_SHIELD)
        ealdnarche:delStatusEffect(xi.effect.ARROW_SHIELD)
        ealdnarche:delStatusEffect(xi.effect.MAGIC_SHIELD)
    end
end

return entity
