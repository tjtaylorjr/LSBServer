-----------------------------------
--  Batterhorn
--  Description: Inflicts damage in a frontal area of effect. Additional effect: Knockback.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Melee
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if target:isInfront(mob) then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 3
    local accmod = 1
    local dmgmod = .8
    local info = xi.mobskills.mobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    return dmg
end

return mobskillObject
