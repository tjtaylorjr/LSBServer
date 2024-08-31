-----------------------------------
-- Ability: Formless Strikes
-- While in effect, melee attacks will not be considered physical damage. No effect on weapon skills.
-- Obtainable: Monk Level 75
-- Recast Time: 0:10:00
-- Duration: 0:03:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.monk.useFormlessStrikes(player, target, ability)
end

return abilityObject
