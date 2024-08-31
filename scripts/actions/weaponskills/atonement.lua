-----------------------------------
-- Atonement
-- TODO: This needs to be reworked, as this weapon skill does damage based on current enmity, not based on stat modifiers. http://wiki.ffxiclopedia.org/wiki/Atonement    http://www.bg-wiki.com/bg/Atonement
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Enmity varies with TP. Burtgang: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Paladin) quest.
-- Aligned with the Aqua Gorget, Flame Gorget & Light Gorget.
-- Aligned with the Aqua Belt, Flame Belt & Light Belt.
-- Element: None
-- Modifiers (old): damage varies with enmity
-- 100%TP    200%TP    300%TP
-- 0.09      0.11      0.20   -CE
-- 0.11      0.14      0.25   -VE
-- Modifiers (new): enmity from damage varies with TP
-- 100%TP    200%TP    300%TP
-- 1.00      1.5       2.0
-- Modifiers (non-mob, wrong): STR:40% VIT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.25      1.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 1, 1.25, 1.5 }
    params.str_wsc = 0.4 params.vit_wsc = 0.5
    params.enmityMult = 1

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local attack =
    {
        ['type'] = xi.attackType.BREATH,
        ['slot'] = xi.slot.MAIN,
        ['weaponType'] = player:getWeaponSkillType(xi.slot.MAIN),
        ['damageType'] = xi.damageType.ELEMENTAL
    }
    local calcParams =
    {
        wsID = wsID,
        criticalHit = false,
        tpHitsLanded = 0,
        extraHitsLanded = 0,
        shadowsAbsorbed = 0,
        bonusTP = 0
    }

    local damage = 0

    if target:getObjType() ~= xi.objType.MOB then -- this isn't correct but might as well use what was originally here if someone uses this on a non-mob
        if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
            params.ftpMod = { 1, 1.5, 2 }
        end

        damage, calcParams.criticalHit, calcParams.tpHitsLanded, calcParams.extraHitsLanded = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    else
        local dmg
        if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
            dmg = (target:getCE(player) + target:getVE(player)) / 6
            -- tp affects enmity multiplier, 1.0 at 1k, 1.5 at 2k, 2.0 at 3k. Gorget/Belt adds 100 tp each.
            params.enmityMult = params.enmityMult + (tp + xi.weaponskills.handleWSGorgetBelt(player) * 1000 - 1000) / 2000
            params.enmityMult = utils.clamp(params.enmityMult, 1, 2) -- necessary because of Gorget/Belt bonus
        else
            local effectiveTP = tp + xi.weaponskills.handleWSGorgetBelt(player) * 1000
            effectiveTP = utils.clamp(effectiveTP, 0, 3000) -- necessary because of Gorget/Belt bonus
            local ceMod = xi.weaponskills.fTP(effectiveTP, { 0.09, 0.11, 0.20 }) -- CE portion of Atonement
            local veMod = xi.weaponskills.fTP(effectiveTP, { 0.11, 0.14, 0.25 }) -- VE portion of Atonement
            dmg = math.floor(target:getCE(player) * ceMod) + math.floor(target:getVE(player) * veMod)
        end

        dmg = utils.clamp(dmg, 0, player:getMainLvl() * 10) -- Damage is capped to player's level * 10, before WS damage mods
        damage = target:breathDmgTaken(dmg)
        if player:getMod(xi.mod.WEAPONSKILL_DAMAGE_BASE + wsID) > 0 then
            damage = damage * (100 + player:getMod(xi.mod.WEAPONSKILL_DAMAGE_BASE + wsID)) / 100
        end

        damage = damage * xi.settings.main.WEAPON_SKILL_POWER
        calcParams.finalDmg = damage

        if damage > 0 then
            if player:getOffhandDmg() > 0 then
                calcParams.tpHitsLanded = 2
            else
                calcParams.tpHitsLanded = 1
            end

            -- Atonement always yields the a TP return of a 2 hit WS (unless it does 0 damage), because if one hit lands, both hits do.
            calcParams.extraHitsLanded = 1
        end

        damage = xi.weaponskills.takeWeaponskillDamage(target, player, params, primary, attack, calcParams, action)
    end

    return calcParams.tpHitsLanded, calcParams.extraHitsLanded, calcParams.criticalHit, damage
end

return weaponskillObject
