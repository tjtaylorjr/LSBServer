-----------------------------------
-- Spell: Triumphant Roar
-- Enhances Attack
-- Spell cost: 36 MP
-- Monster Type: Demon
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+3
-- Level: 71
-- Casting Time: 3 seconds
-- Recast Time: 90 seconds
-----------------------------------
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 15
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 60)

    if not target:addStatusEffect(xi.effect.ATTACK_BOOST, power, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return xi.effect.ATTACK_BOOST
end

return spellObject
