-----------------------------------
-- Victory Smite
-- Hand-to-Hand Weapon Skill
-- Skill Level: N/A
-- Description: Delivers a fourfold attack. Chance of params.critical hit varies with TP.
-- Must have Verethragna (85)/(90)/(95)/(99)/(99-2) or Revenant Fists +1/+2/+3 equipped.
-- Aligned with the Light Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Light Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Light, Fragmentation
-- Modifiers: STR:60%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
-- 2.25        2.25    2.25
-- params.critical Chance added with TP:
-- 100%TP    200%TP    300%TP
-- 10%        25%        45%
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 4
    params.ftpMod = { 2.25, 2.25, 2.25 }
    params.str_wsc = 0.6
    params.critVaries = { 0.1, 0.25, 0.45 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true -- http://wiki.ffo.jp/html/21093.html
        params.ftpMod = { 1.5, 1.5, 1.5 }
        params.str_wsc = 0.8
    end

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.EMPYREAN)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
