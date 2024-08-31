-----------------------------------
-- Area: Apollyon (Central)
--  Mob: Proto-Omega
-----------------------------------
local entity = {}

local quadrupedForm = function(mob)
    mob:setAnimationSub(1)
    mob:setMod(xi.mod.MOVE_SPEED_STACKABLE, 100)
    mob:setMod(xi.mod.ATTP, 100)
    mob:setMod(xi.mod.UDMGPHYS, -9000)
    mob:setMod(xi.mod.UDMGRANGE, -9000)
    mob:setMod(xi.mod.UDMGMAGIC, -3000)
    mob:setMobMod(xi.mobMod.SKILL_LIST, 727)
end

local bipedForm = function(mob)
    mob:setAnimationSub(2)
    mob:setMod(xi.mod.MOVE_SPEED_STACKABLE, 0)
    mob:setMod(xi.mod.ATTP, 200)
    mob:setMod(xi.mod.UDMGPHYS, -3000)
    mob:setMod(xi.mod.UDMGRANGE, -3000)
    mob:setMod(xi.mod.UDMGMAGIC, -9000)
    mob:setMobMod(xi.mobMod.SKILL_LIST, 1188)
end

local finalForm = function(mob)
    mob:setLocalVar('final', 1)
    mob:setAnimationSub(2)
    mob:setMod(xi.mod.ATTP, 250)
    mob:setMod(xi.mod.UDMGPHYS, -5000)
    mob:setMod(xi.mod.UDMGRANGE, -5000)
    mob:setMod(xi.mod.UDMGMAGIC, -5000)
    mob:setMod(xi.mod.REGAIN, 100)
    mob:setMobMod(xi.mobMod.SKILL_LIST, 1189)
end

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.SOUND_RANGE, 25)
end

entity.onMobSpawn = function(mob)
    mob:setMobMod(xi.mobMod.CANNOT_GUARD, 1)
    mob:setMod(xi.mod.COUNTER, 10)
    mob:setMod(xi.mod.REGAIN, 50)
    mob:setMod(xi.mod.REGEN, 25)
    mob:setBehaviour(bit.bor(mob:getBehaviour(), xi.behavior.NO_TURN))
    quadrupedForm(mob)
end

entity.onMobEngage = function(mob, target)
    mob:setLocalVar('formTime', os.time() + 120)
end

entity.onMobFight = function(mob, target)
    local now = os.time()

    -- If in Final form then do Pod Ejection every 5 minutes
    if mob:getLocalVar('final') == 1 then
        if
            now >= mob:getLocalVar('gunpodTime') and
            mob:getCurrentAction() == xi.act.ATTACK and
            GetMobByID(mob:getID() + 1):getStatus() == xi.status.DISAPPEAR
        then
            mob:setLocalVar('gunpodTime', now + utils.minutes(5))
            mob:useMobAbility(1532) -- Pod Ejection
        end

        return
    end

    -- Convert into final form at 25% HP
    if mob:getHPP() <= 25 then
        finalForm(mob)
        return
    end

    -- Swap between forms every 2 minutes
    local form = mob:getLocalVar('formTime')
    if now >= form and mob:getCurrentAction() == xi.act.ATTACK then
        mob:setLocalVar('formTime', now + utils.minutes(2))
        if mob:getAnimationSub() == 1 then
            bipedForm(mob)

            -- Wait for 4.5s while changing form and then do Pod Ejection
            mob:wait(4500)
            mob:timer(4500, function(mobArg)
                if mob:isAlive() and mob:getLocalVar('initialGunpod') == 0 then
                    mob:setLocalVar('initialGunpod', 1)
                    mob:useMobAbility(1532) -- Pod Ejection
                end
            end)
        else
            quadrupedForm(mob)
            mob:wait(4500)
        end
    end
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN)
end

entity.onMobDeath = function(mob, player, optParams)
    if player then
        player:addTitle(xi.title.APOLLYON_RAVAGER)
    end
end

return entity
