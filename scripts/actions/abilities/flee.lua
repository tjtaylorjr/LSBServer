-----------------------------------
-- Ability: Flee
-- Increases movement speed.
-- Obtained: Thief Level 25
-- Recast Time: 5:00
-- Duration: 0:30
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.thief.useFlee(player, target, ability)
end

return abilityObject
