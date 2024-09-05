-----------------------------------
-- Area: Empyreal Paradox
--  Mob: Selh'teus
-- Chains of Promathia 8-4 BCNM Fight
-----------------------------------
local ID = zones[xi.zone.EMPYREAL_PARADOX]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:addMod(xi.mod.REGAIN, 50)
    mob:addMod(xi.mod.CURE_POTENCY_RCVD, -100)
    mob:setAutoAttackEnabled(false)
end

entity.onMobFight = function(mob, target)
    if target:getTarget():getID() ~= mob:getID() then
        local targetPos = target:getPos()
        local radians = (256 - targetPos.rot) * (math.pi / 128)
        mob:pathTo(targetPos.x + math.cos(radians) * 16, targetPos.y, targetPos.z + math.sin(radians) * 16)
    end

    local lanceTime = mob:getLocalVar('lanceTime')
    local lanceOut = mob:getLocalVar('lanceOut')
    local rejuv = mob:getLocalVar('rejuv')
    if mob:getHPP() < 30 and rejuv == 0 and target:getFamily() == 478 then
        mob:messageText(mob, ID.text.SELHTEUS_TEXT + 2)
        mob:useMobAbility(1509)
        mob:setLocalVar('rejuv', 1)
    elseif lanceTime + 50 < mob:getBattleTime() and lanceOut == 0 then
        mob:entityAnimationPacket(xi.animationString.SPECIAL_00)
        mob:setLocalVar('lanceOut', 1)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    mob:messageText(mob, ID.text.SELHTEUS_TEXT)
    mob:getBattlefield():lose()
end

return entity
