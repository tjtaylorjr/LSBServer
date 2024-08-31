-----------------------------------
-- Lunar Cry
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local moon = VanadielMoonPhase()
    local buffvalue = 1
    if moon > 90 then
        buffvalue = 31
    elseif moon > 75 then
        buffvalue = 26
    elseif moon > 60 then
        buffvalue = 21
    elseif moon > 40 then
        buffvalue = 16
    elseif moon > 25 then
        buffvalue = 11
    elseif moon > 10 then
        buffvalue = 6
    end

    target:delStatusEffect(xi.effect.ACCURACY_DOWN)
    target:delStatusEffect(xi.effect.EVASION_DOWN)
    target:addStatusEffect(xi.effect.ACCURACY_DOWN, buffvalue, 0, 180)
    target:addStatusEffect(xi.effect.EVASION_DOWN, 32-buffvalue, 0, 180)

    if target:getID() == action:getPrimaryTargetID() then
        petskill:setMsg(xi.msg.basic.ACC_EVA_DOWN)
    end

    return 0
end

return abilityObject
