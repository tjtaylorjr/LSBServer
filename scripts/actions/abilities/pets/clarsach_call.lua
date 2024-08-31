-----------------------------------
-- Clarsach Call
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

-- https://www.bg-wiki.com/ffxi/Clarsach_Call
abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = math.floor(48 + pet:getMainLvl() * 8 + (pet:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)) * 1.5)

    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.WIND, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.WIND, petskill)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.WIND, 1)

    summoner:setMP(0)
    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.WIND)
    target:updateEnmityFromDamage(pet, damage)

    pet:addStatusEffect(xi.effect.ATTACK_BOOST,        25, 0, 180)
    pet:addStatusEffect(xi.effect.DEFENSE_BOOST,       25, 0, 180)
    pet:addStatusEffect(xi.effect.MAGIC_ATK_BOOST,     25, 0, 180)
    pet:addStatusEffect(xi.effect.MAGIC_DEF_BOOST,     25, 0, 180)
    pet:addStatusEffect(xi.effect.EVASION_BOOST,       50, 0, 180)
    pet:addStatusEffect(xi.effect.MAGIC_EVASION_BOOST, 50, 0, 180)

    return damage
end

return abilityObject
