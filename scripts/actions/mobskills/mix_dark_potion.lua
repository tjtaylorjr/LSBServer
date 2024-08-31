-----------------------------------
-- Mix: Dark Potion - Deals 666 damage to a single enemy.
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    -- skill:setMsg(xi.msg.basic.READIES_WS) -- not needed?
    return 666
end

return mobskillObject
