-----------------------------------
-- Petrifaction
-- Description: Petrifies opponent with a gaze attack
-- Type: Gaze
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Single gaze
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.mobskills.mobGazeMove(mob, target, xi.effect.PETRIFICATION, 1, 0, 25))

    return xi.effect.PETRIFICATION
end

return mobskillObject
