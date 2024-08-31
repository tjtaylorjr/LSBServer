-----------------------------------
--  Axe Throw
--
--  Description: Ranged attack with the equipped weapon, which is lost.
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: 7.0
--  Notes: Only used by armed BST Mamool Ja
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:getAnimationSub() == 0 and mob:getMainJob() == xi.job.BST then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod  = 1
    local dmgmod  = 1
    local info    = xi.mobskills.mobRangedMove(mob, target, skill, numhits, accmod, dmgmod, xi.mobskills.physicalTpBonus.ACC_VARIES)
    local dmg     = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.RANGED, xi.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, xi.attackType.RANGED, xi.damageType.SLASHING)

    return dmg
end

return mobskillObject
