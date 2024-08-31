-----------------------------------
-- Ability: Accomplice
-- Steals half of the target party member's enmity and redirects it to the thief.
-- Obtained: Thief Level 65
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.thief.checkAccomplice(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.thief.useAccomplice(player, target, ability)
end

return abilityObject
