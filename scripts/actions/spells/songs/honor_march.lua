-----------------------------------
-- Spell: Honor March
-- Gives party members Haste, Acc, Ranged Acc, Att, Ranged Att
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.spells.enhancing.useEnhancingSong(caster, target, spell)
end

return spellObject
