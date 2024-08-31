-----------------------------------
-- Ecliptic Growl
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
        buffvalue = 7
    elseif moon > 75 then
        buffvalue = 6
    elseif moon > 60 then
        buffvalue = 5
    elseif moon > 40 then
        buffvalue = 4
    elseif moon > 25 then
        buffvalue = 3
    elseif moon > 10 then
        buffvalue = 2
    end

    target:delStatusEffect(xi.effect.STR_BOOST)
    target:delStatusEffect(xi.effect.DEX_BOOST)
    target:delStatusEffect(xi.effect.VIT_BOOST)
    target:delStatusEffect(xi.effect.AGI_BOOST)
    target:delStatusEffect(xi.effect.MND_BOOST)
    target:delStatusEffect(xi.effect.CHR_BOOST)

    target:addStatusEffect(xi.effect.STR_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.DEX_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.VIT_BOOST, buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.AGI_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.INT_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.MND_BOOST, 8-buffvalue, 0, duration)
    target:addStatusEffect(xi.effect.CHR_BOOST, 8-buffvalue, 0, duration)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(xi.msg.basic.STATUS_BOOST)
    else
        petskill:setMsg(xi.msg.basic.STATUS_BOOST_2)
    end

    return 0
end

return abilityObject
