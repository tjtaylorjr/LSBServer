-----------------------------------
-- Frenzied Rage
--
-- Description: Attack Boost
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 20% Attack Boost.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 20
    local duration = 120

    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.ATTACK_BOOST, power, 0, duration))
    return xi.effect.ATTACK_BOOST
end

return mobskillObject
