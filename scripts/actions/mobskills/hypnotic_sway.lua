-----------------------------------
-- Hypnotic Sway
-- Description: Inflicts amnesia conal
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local power = 1
    local duration = xi.mobskills.calculateDuration(skill:getTP(), 30, 60)

    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, xi.effect.AMNESIA, power, 0, duration))
    return xi.effect.AMNESIA
end

return mobskillObject
