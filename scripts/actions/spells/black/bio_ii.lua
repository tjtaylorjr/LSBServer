-----------------------------------
-- Spell: Bio II
-- Deals dark damage that weakens an enemy's attacks and gradually reduces its HP.
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local skillLvl = caster:getSkillLevel(xi.skill.DARK_MAGIC)
    local basedmg = skillLvl / 4
    local params = {}
    params.dmg = basedmg
    params.multiplier = 2
    params.skillType = xi.skill.DARK_MAGIC
    params.attribute = xi.mod.INT
    params.hasMultipleTargetReduction = false
    params.diff = caster:getStat(xi.mod.INT)-target:getStat(xi.mod.INT)
    params.bonus = 10

    -- Calculate raw damage
    local dmg = calculateMagicDamage(caster, target, spell, params)
    -- Softcaps at 30, should always do at least 1
    dmg = utils.clamp(dmg, 1, 30)
    -- Get resist multiplier (1x if no resist)
    local resist = applyResistanceEffect(caster, target, spell, params)
    -- Get the resisted damage
    dmg = dmg * resist
    -- Add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster, spell, target, dmg)
    -- Add in target adjustment
    dmg = adjustForTarget(target, dmg, spell:getElement())
    -- Add in final adjustments including the actual damage dealt
    local final = finalMagicAdjustments(caster, target, spell, dmg)

    -- Calculate duration
    local duration = 120

    -- Check for Dia
    local dia = target:getStatusEffect(xi.effect.DIA)

    -- Calculate DoT effect
    -- http://wiki.ffo.jp/html/1954.html
    -- This formula gives correct values for every breakpoint listed on that site
    local dotdmg = math.floor((skillLvl + 29) / 40)
    dotdmg = utils.clamp(dotdmg, 3, 8)

    -- Do it!
    target:addStatusEffect(xi.effect.BIO, dotdmg, 3, duration, 0, 15, 2)
    spell:setMsg(xi.msg.basic.MAGIC_DMG)

    -- Try to kill same tier Dia (default behavior)
    if xi.settings.main.DIA_OVERWRITE == 1 and dia ~= nil then
        if dia:getPower() <= 2 then
            target:delStatusEffect(xi.effect.DIA)
        end
    end

    return final
end

return spellObject
