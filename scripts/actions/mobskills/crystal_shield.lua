-----------------------------------
-- Crystal Shield
-- Protect II
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobBuffMove(mob, xi.effect.PROTECT, 50, 0, 300))

    return xi.effect.PROTECT
end

return mobskillObject
