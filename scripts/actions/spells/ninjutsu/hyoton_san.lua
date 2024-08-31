-----------------------------------
-- Spell: Hyoton: San
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = 15 + caster:getMerit(xi.merit.HYOTON_EFFECT) -- T1 bonus debuff duration
    target:addStatusEffectEx(xi.effect.NINJUTSU_ELE_DEBUFF, 0, 30, 0, duration, 0, xi.mod.FIRE_MEVA, 0)

    return xi.spells.damage.useDamageSpell(caster, target, spell)
end

return spellObject
