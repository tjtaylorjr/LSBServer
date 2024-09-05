-----------------------------------
-- Area: Attohwa Chasm
--   NM: Sargas
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.AUTO_SPIKES, 1)
    mob:addStatusEffect(xi.effect.SHOCK_SPIKES, 50, 0, 0)
    mob:getStatusEffect(xi.effect.SHOCK_SPIKES):setEffectFlags(xi.effectFlag.DEATH)
end

entity.onMobSpawn = function(mob)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 40)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.STUN, { chance = 65, duration = math.random(5, 15) })
end

entity.onSpikesDamage = function(mob, target, damage)
    local intDiff = mob:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    local dmg = damage + intDiff
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    dmg = addBonusesAbility(mob, xi.element.THUNDER, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob, target, xi.element.THUNDER, 0)
    dmg = adjustForTarget(target, dmg, xi.element.THUNDER)
    dmg = finalMagicNonSpellAdjustments(mob, target, xi.element.THUNDER, dmg)

    if dmg < 0 then
        dmg = 0
    end

    return xi.subEffect.SHOCK_SPIKES, xi.msg.basic.SPIKES_EFFECT_DMG, dmg
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 279)
end

entity.onMobDespawn = function(mob)
    -- UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 10800)) -- 2 to 3 hrs
end

return entity
