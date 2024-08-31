-----------------------------------
-- Spell: Saline Coat
-- Enhances magic defense
-- Spell cost: 66 MP
-- Monster Type: Luminians
-- Spell Type: Magical (Light)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+2, AGI+2, MP+10
-- Level: 72
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 60 seconds
-----------------------------------
-- Combos: Defense Bonus
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local power = 50
    local tick = 4 -- decay by 1 every 4 seconds
    local duration = xi.spells.blue.calculateDurationWithDiffusion(caster, 180)

    if not target:addStatusEffect(xi.effect.MAGIC_DEF_BOOST, power, tick, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end

    return xi.effect.MAGIC_DEF_BOOST
end

return spellObject
