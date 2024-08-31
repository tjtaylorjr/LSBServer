-----------------------------------
-- Spell: Light of Penance
-- Reduces an enemy's TP. Additional effect: Blindness and "Bind"
-- Spell cost: 53 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: CHR+1, HP+15
-- Level: 58
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.BEASTMEN
    params.effect = xi.effect.BLINDNESS
    params.attribute = xi.mod.INT
    params.skillType = xi.skill.BLUE_MAGIC
    local duration = 30
    local returnEffect = xi.effect.BLINDNESS

    local resist = applyResistanceEffect(caster, target, spell, params)
    if resist >= 0.5 then

        spell:setMsg(xi.msg.basic.MAGIC_TP_REDUCE) -- this doesn't seem to do much
        target:delTP(100)
        local actionOne = target:addStatusEffect(xi.effect.BLINDNESS, 10, 0, duration * resist)
        local actionTwo = target:addStatusEffect(xi.effect.BIND, 1, 0, duration * resist)

        -- Gaze move
        if target:isFacing(caster) and caster:isFacing(target) then

            -- If at least one of effects got applied, set the message type
            if actionOne or actionTwo then
                spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
            end

            -- Set the returnEffect to effectTwo if the first one failed
            if not actionOne and actionTwo then
                returnEffect = xi.effect.BIND
            end

        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return returnEffect
end

return spellObject
