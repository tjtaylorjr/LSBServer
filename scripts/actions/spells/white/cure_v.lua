-----------------------------------
-- Spell: Cure V
-- Restores target's HP.
-- Shamelessly stolen from http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local divisor = 0
    local constant = 0
    local basepower = 0
    local power = 0
    local basecure = 0
    local final = 0

    local minCure = 450
    if xi.settings.main.USE_OLD_CURE_FORMULA then
        power = getCurePowerOld(caster)
        divisor = 0.6666
        constant = 330
        if power > 560 then
            divisor = 2.8333
            constant = 591.2
        elseif power > 320 then
            divisor = 1
            constant = 410
        end
    else
        power = getCurePower(caster)
        if power < 150 then
            divisor = 0.70
            constant = 450
            basepower = 80
        elseif power < 190 then
            divisor =  1.25
            constant = 550
            basepower = 150
        elseif power < 260 then
            divisor = 70 / 38
            constant = 582
            basepower = 190
        elseif power < 300 then
            divisor = 2
            constant = 620
            basepower = 260
        elseif power < 500 then
            divisor = 2.5
            constant = 640
            basepower = 300
        elseif power < 700 then
            divisor = 10 / 3
            constant = 720
            basepower = 500
        else
            divisor = 999999
            constant = 780
            basepower = 0
        end
    end

    if isValidHealTarget(caster, target) then -- e.g. is a PC and not a monster (?)
        if xi.settings.main.USE_OLD_CURE_FORMULA then
            basecure = getBaseCureOld(power, divisor, constant)
        else
            basecure = getBaseCure(power, divisor, constant, basepower)
        end

        final = getCureFinal(caster, spell, basecure, minCure, false)
        if
            caster:hasStatusEffect(xi.effect.AFFLATUS_SOLACE) and
            not target:hasStatusEffect(xi.effect.STONESKIN)
        then
            local solaceStoneskin = 0
            local equippedBody = caster:getEquipID(xi.slot.BODY)
            if equippedBody == 11186 then
                solaceStoneskin = math.floor(final * 0.30)
            elseif equippedBody == 11086 then
                solaceStoneskin = math.floor(final * 0.35)
            else
                solaceStoneskin = math.floor(final * 0.25)
            end

            solaceStoneskin = solaceStoneskin * (1 + caster:getMerit(xi.merit.ANIMUS_SOLACE) / 100)

            target:addStatusEffect(xi.effect.STONESKIN, solaceStoneskin, 0, 25, 0, 0, 1)
        end

        final = final + (final * (target:getMod(xi.mod.CURE_POTENCY_RCVD) / 100))

        --Applying server mods
        final = final * xi.settings.main.CURE_POWER

        local diff = (target:getMaxHP() - target:getHP())
        if final > diff then
            final = diff
        end

        target:addHP(final)

        target:wakeUp()

        -- pass in fixed enmity values of 300 CE and 600 VE
        caster:updateEnmityFromCure(target, final, 300, 600)

    else
        if target:isUndead() then -- e.g. PCs healing skeles for damage (?)
            spell:setMsg(xi.msg.basic.MAGIC_DMG)

            final = xi.spells.damage.useDamageSpell(caster, target, spell)
        elseif caster:getObjType() == xi.objType.PC then
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        else
            -- e.g. monsters healing themselves.
            if xi.settings.main.USE_OLD_CURE_FORMULA then
                basecure = getBaseCureOld(power, divisor, constant)
            else
                basecure = getBaseCure(power, divisor, constant, basepower)
            end

            final = getCureFinal(caster, spell, basecure, minCure, false)
            local diff = (target:getMaxHP() - target:getHP())
            if final > diff then
                final = diff
            end

            target:addHP(final)
        end
    end

    local mpBonusPercent = (final * caster:getMod(xi.mod.CURE2MP_PERCENT)) / 100
    if mpBonusPercent > 0 then
        caster:addMP(mpBonusPercent)
    end

    return final
end

return spellObject
