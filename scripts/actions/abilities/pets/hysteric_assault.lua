-----------------------------------
-- Hysteric Assault
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

-- http://wiki.ffo.jp/html/37933.html
abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 3
    local accmod = 1
    local dmgmod = 5.0

    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = xi.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 0, xi.mobskills.physicalTpBonus.CRIT_VARIES, 1, 1, 1)
    local totaldamage = xi.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, xi.attackType.PHYSICAL, xi.damageType.PIERCING, numhits)

    xi.job_utils.summoner.calculateTPReturn(pet, target, totaldamage, damage.hitslanded)

    target:takeDamage(totaldamage, pet, xi.attackType.PHYSICAL, xi.damageType.PIERCING)
    target:updateEnmityFromDamage(pet, totaldamage)

    pet:addHP(totaldamage) -- This is like Sanguine Blade: https://www.bg-wiki.com/ffxi/Hysteric_Assault
    return totaldamage
end

return abilityObject
