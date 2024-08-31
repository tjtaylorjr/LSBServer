-----------------------------------
-- Spell: FireSpirit
-- Summons FireSpirit to fight by your side
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    local result = 0
    if caster:hasPet() then
        result = xi.msg.basic.ALREADY_HAS_A_PET
    elseif not caster:canUseMisc(xi.zoneMisc.PET) then
        result = xi.msg.basic.CANT_BE_USED_IN_AREA
    elseif caster:getObjType() == xi.objType.PC then
        result = xi.summon.avatarMiniFightCheck(caster)
    end

    return result
end

spellObject.onSpellCast = function(caster, target, spell)
    xi.pet.spawnPet(caster, xi.petId.FIRE_SPIRIT)
    return 0
end

return spellObject
