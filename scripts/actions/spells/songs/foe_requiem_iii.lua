-----------------------------------
-- Spell: Foe Requiem III
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:hasImmunity(xi.immunity.REQUIEM) then
        spell:setMsg(xi.msg.basic.MAGIC_COMPLETE_RESIST)
        return
    end

    local effect = xi.effect.REQUIEM
    local duration = 95
    local power = 3

    -- local pCHR = caster:getStat(xi.mod.CHR)
    -- local mCHR = target:getStat(xi.mod.CHR)
    -- local dCHR = (pCHR - mCHR)
    local params = {}
    params.diff = nil
    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.SINGING
    params.bonus = 0
    params.effect = nil
    local resm = applyResistanceEffect(caster, target, spell, params)
    if resm < 0.5 then
        spell:setMsg(xi.msg.basic.MAGIC_RESIST) -- resist message
        return 1
    end

    local iBoost = caster:getMod(xi.mod.REQUIEM_EFFECT) + caster:getMod(xi.mod.ALL_SONGS_EFFECT)
    power = power + iBoost

    -- JP Bonus
    power = power + caster:getJobPointLevel(xi.jp.REQUIEM_EFFECT) * 3

    if caster:hasStatusEffect(xi.effect.SOUL_VOICE) then
        power = power * 2
    elseif caster:hasStatusEffect(xi.effect.MARCATO) then
        power = power * 1.5
    end

    caster:delStatusEffect(xi.effect.MARCATO)

    duration = duration * ((iBoost * 0.1) + (caster:getMod(xi.mod.SONG_DURATION_BONUS) / 100) + 1)

    if caster:hasStatusEffect(xi.effect.TROUBADOUR) then
        duration = duration * 2
    end

    -- Try to overwrite weaker slow / haste
    if target:addStatusEffect(effect, power, 3, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_ENFEEB)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return effect
end

return spellObject
