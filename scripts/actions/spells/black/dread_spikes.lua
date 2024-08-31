-----------------------------------
-- Spell: Dread Spikes
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local duration = calculateDuration(xi.settings.main.SPIKE_EFFECT_DURATION, spell:getSkillType(), spell:getSpellGroup(), caster, target)
    local drainAmount = target:getMaxHP() / 2

    drainAmount = drainAmount * (1 + (caster:getMod(xi.mod.DREAD_SPIKES_EFFECT) / 100))

    if target:addStatusEffect(xi.effect.DREAD_SPIKES, 0, 0, duration, 0, drainAmount, 1) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return xi.effect.DREAD_SPIKES
end

return spellObject
