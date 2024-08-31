-----------------------------------
-- Entropy
-- Scythe weapon skill
-- Skill level: 357
-- Description: Delivers a fourfold attack that converts damage dealt into own MP. Damage varies with TP.
-- In order to obtain Entropy, the quest Martial Mastery must be completed.
-- MP recovery is about 15~25% of damage dealt.
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.
-- Element: None
-- Modifiers: INT:73~85%, depending on merit points upgrades.
-- 100%TP    200%TP    300%TP
-- 0.75       1.25       2.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 4
    params.ftpMod = { 0.75, 1.25, 2.0 }
    params.int_wsc = player:getMerit(xi.merit.ENTROPY) * 0.17

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.int_wsc = 0.7 + (player:getMerit(xi.merit.ENTROPY) * 0.03)
        params.multiHitfTP = true
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    player:addMP(damage * 0.2)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
