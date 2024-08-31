-----------------------------------
-- Spell: Geo-Malaise
-- Reduces magic defense for enemies within area of effect.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return xi.job_utils.geomancer.geoOnMagicCastingCheck(caster, target, spell)
end

spellObject.onSpellCast = function(caster, target, spell)
    xi.job_utils.geomancer.spawnLuopan(caster, target, spell)
end

return spellObject
