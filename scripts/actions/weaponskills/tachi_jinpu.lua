-----------------------------------
-- Tachi Jinpu
-- Great Katana weapon skill
-- Skill level: 150
-- Two-hit attack. Deals Physical and wind elemental damage to enemy. Additonal Effect Damage varies with TP.
-- Will stack with Sneak Attack and Souleater.
-- Aligned with the Breeze Gorget & Shadow Gorget.
-- Aligned with the Breeze Belt & Shadow Belt.
-- Element: Wind
-- Modifiers: STR:30%
-- 100%TP    200%TP    300%TP
-- .5         .75      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 1.0, 1.0, 1.0 }
    params.str_wsc = 0.4
    params.hybridWS = true
    params.includemab = true
    params.ele = xi.element.WIND
    params.skill = xi.skill.GREAT_KATANA

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 0.5, 0.75, 1.0 }
        params.str_wsc = 0.3
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
