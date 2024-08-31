-----------------------------------
-- Spell: Magic Finale
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:hasImmunity(xi.immunity.DISPEL) then
        spell:setMsg(xi.msg.basic.MAGIC_COMPLETE_RESIST)
        return
    end

    -- Pull base stats.
    -- local dCHR = (caster:getStat(xi.mod.CHR) - target:getStat(xi.mod.CHR))

    local params = {}
    params.diff = nil
    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.SINGING
    params.bonus = caster:getMod(xi.mod.FINALE_EFFECT) + caster:getMod(xi.mod.ALL_SONGS_EFFECT)
    params.effect = nil

    local resist = applyResistanceEffect(caster, target, spell, params)
    local effect = xi.effect.NONE

    if resist > 0.0625 then
        spell:setMsg(xi.msg.basic.MAGIC_ERASE)
        effect = target:dispelStatusEffect()
        if effect == xi.effect.NONE then
            -- no effect
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return effect
end

return spellObject
