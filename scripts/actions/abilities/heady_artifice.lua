-----------------------------------
-- Ability: Heady Artifice
-- Description: Allows automatons to perform a special ability that varies with the head used.
-- Obtained: PUP Level 96
-- Recast Time: 01:00:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    -- target:addStatusEffect(xi.effect.HEADY_ARTIFICE, 18, 1, 1) -- TODO: implement xi.effect.HEADY_ARTIFICE
end

return abilityObject
