-----------------------------------
-- Ability: Wild Card
-- Has a random effect on all party members within area of effect.
-- Obtained: Corsair Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

abilityObject.onUseAbility = function(caster, target, ability, action)
    return xi.job_utils.corsair.useWildCard(caster, target, ability, action)
end

return abilityObject
