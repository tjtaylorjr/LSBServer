-----------------------------------
-- Ability: Accession
-- Allows avatars to use their full strength and allows summmoning of Odin and Alexander.
-- Obtained: Summoner Level 1
-- Recast Time: 1:00:00
-- Duration: 0:03:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.ASTRAL_FLOW, 1, 0, 180)

    return xi.effect.ASTRAL_FLOW
end

return abilityObject
