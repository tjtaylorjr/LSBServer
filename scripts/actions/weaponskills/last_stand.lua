-----------------------------------
-- Last Stand
-- Skill Level: 357
-- Description: Attacks once or twice, depending on remaining ammunition. Damage dealt varies with TP.
-- If the first shot of the weapon skill does enough damage to defeat the target, the second shot will not be used.
-- To obtain Last Stand, the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit fTP is duplicated for all additional hits.
-- Aligned with the Flame Gorget, Light Gorget & Aqua Gorget.
-- Properties
-- Element: N/A
-- Skillchain Properties: Fusion/Reverberation
-- Modifiers: AGI:100%
-- Damage Multipliers by TP:
-- 100%TP    200%TP    300%TP
--   2.0    2.125    2.25

-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 2.0, 2.125, 2.25 }
    params.agi_wsc = player:getMerit(xi.merit.LAST_STAND) * 0.17
    params.multiHitfTP = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 2.0, 3.0, 4.0 }
        params.agi_wsc = 0.7 + (player:getMerit(xi.merit.LAST_STAND) * 0.03)
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
