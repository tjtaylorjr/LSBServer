-----------------------------------
-- Heavy Shot
-- Marksmanship weapon skill
-- Skill Level: 225
-- Delivers a single-hit attack. Chance of params.critical varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: AGI:30%
-- 100%TP    200%TP    300%TP
-- 3.50      3.50      3.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.5, 3.5, 3.5 }
    params.agi_wsc = 0.3
    params.critVaries = { 0.1, 0.3, 0.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.agi_wsc = 0.7
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
