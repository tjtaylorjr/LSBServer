-----------------------------------
-- Ability: Thunder Maneuver
-- Enhances the effect of thunder attachments. Must have animator equipped.
-- Obtained: Puppetmaster level 1
-- Recast Time: 10 seconds (shared with all maneuvers)
-- Duration: 1 minute
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.automaton.onManeuverCheck(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability, action)
    return xi.automaton.onUseManeuver(player, target, ability, action)
end

return abilityObject
