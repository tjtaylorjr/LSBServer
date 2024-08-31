-----------------------------------
-- Spell: Sacrifice
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local removables = { xi.effect.FLASH, xi.effect.BLINDNESS, xi.effect.PARALYSIS, xi.effect.POISON, xi.effect.CURSE_I, xi.effect.CURSE_II, xi.effect.DISEASE, xi.effect.PLAGUE }

    -- remove one effect and add it to me
    for i, effect in ipairs(removables) do
        local statusEffect = target:getStatusEffect(effect)
        if statusEffect then
            spell:setMsg(xi.msg.basic.MAGIC_ABSORB_AILMENT)

            -- only add it to me if I don't have it
            if not caster:hasStatusEffect(effect) then
                caster:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
            end

            target:delStatusEffect(effect)
            return 1
        end
    end

    spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT) -- no effect
    return 0
end

return spellObject
