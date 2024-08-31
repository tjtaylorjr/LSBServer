-----------------------------------
-- Ability: Sepulcher
-- Description: Lowers accuracy, evasion, magic accuracy, magic evasion and TP gain for undead.
-- Obtained: PLD Level 87
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.paladin.checkSepulcher(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    xi.job_utils.paladin.useSepulcher(player, target, ability)
end

return abilityObject
