-----------------------------------
-- Spell: Indi-Frailty
-- Reduces defense of enemies near the caster.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.job_utils.geomancer.indiOnMagicCastingCheck(caster, target, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.job_utils.geomancer.doIndiSpell(caster, target, spell)
end

return spellObject
