-----------------------------------
-- Snatch Morsel
-- Steals food effect
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    if target:hasStatusEffect(xi.effect.FOOD) then
        -- 99% sure retail doesn't do this. Uncomment if you want it to happen.
        -- local foodID = target:getStatusEffect(xi.effect.FOOD):getSubType()
        -- local duration = target:getStatusEffect(xi.effect.FOOD):getDuration()
        -- mob:addStatusEffect(xi.effect.FOOD, 0, 0, duration, foodID) -- Gives Colibri the players food.
        target:delStatusEffectSilent(xi.effect.FOOD)
        skill:setMsg(xi.msg.basic.SKILL_ERASE)
    else
        skill:setMsg(xi.msg.basic.SKILL_MISS) -- no effect
    end

    return xi.effect.FOOD
end

return mobskillObject
