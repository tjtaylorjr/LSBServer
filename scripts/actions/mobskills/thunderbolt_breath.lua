-----------------------------------
--  Thunderbolt Breath
--  Description: Deals thunder damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Thunder)
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    -- not used in Uleguerand_Range
    if mob:getZoneID() == 5 then
        return 1
    end

    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.STUN, 1, 0, 7)

    local dmgmod = xi.mobskills.mobBreathMove(mob, target, skill, 0.333, 0.625, xi.element.THUNDER, 500)
    local dmg    = xi.mobskills.mobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.THUNDER, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.THUNDER)
    return dmg
end

return mobskillObject
