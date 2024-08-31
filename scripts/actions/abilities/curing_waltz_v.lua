-----------------------------------
-- Ability: Curing Waltz V
-- Restores target's HP
-- Obtained: Dancer Level 87
-- TP Required: 80%
-- Recast Time: 00:23
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.dancer.checkWaltzAbility(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return xi.job_utils.dancer.useWaltzAbility(player, target, ability, action)
end

return abilityObject
