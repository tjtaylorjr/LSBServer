-----------------------------------
-- Demonic Flower
-- Deals magic damage to a single target.
-- Effect varies with HP and inflicts caster with weakness.
-- Deals souleater like damage to the user.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmg1 = mob:getHP() * 0.24
    local dmg2 = dmg1 * 0.5

    -- The dmg amounts and duration are guesstimated based on wiki info.
    skill:setMsg(xi.mobskills.mobStatusEffectMove(mob, target, xi.effect.WEAKNESS, 1, 0, 90))

    mob:takeDamage(dmg1)
    target:takeDamage(dmg2, mob, xi.attackType.MAGICAL, xi.damageType.ELEMENTAL)

    return dmg2
end

return mobskillObject
