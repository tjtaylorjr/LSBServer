-----------------------------------
-- Ecliptic Howl
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime

    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local moon = VanadielMoonPhase()
    local buffvalue = 1
    if moon > 90 then
        buffvalue = 25
    elseif moon > 75 then
        buffvalue = 21
    elseif moon > 60 then
        buffvalue = 17
    elseif moon > 40 then
        buffvalue = 13
    elseif moon > 25 then
        buffvalue = 9
    elseif moon > 10 then
        buffvalue = 5
    end

    target:delStatusEffect(xi.effect.ACCURACY_BOOST)
    target:delStatusEffect(xi.effect.EVASION_BOOST)
    target:addStatusEffect(xi.effect.ACCURACY_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.EVASION_BOOST, 25-buffvalue, 0, duration)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(xi.msg.basic.ACC_EVA_BOOST)
    else
        petskill:setMsg(xi.msg.basic.ACC_EVA_BOOST_2)
    end

    return 0
end

return abilityObject
