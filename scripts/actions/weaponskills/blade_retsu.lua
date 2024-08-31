-----------------------------------
-- Blade Retsu
-- Katana weapon skill
-- Skill Level: 30
-- Delivers a two-hit attack. Paralyzes enemy. Duration of paralysis varies with TP.
-- Proc rate of Paralyze seems to be based on your level in comparison to the targets level. The higher level you are compared to your target, it will be Paralyzed more often.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: STR:20%  DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 1.0, 1.0, 1.0 }
    params.str_wsc = 0.2 params.dex_wsc = 0.2

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.dex_wsc = 0.6
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    if damage > 0 and not target:hasStatusEffect(xi.effect.PARALYSIS) then
        local duration = (tp / 1000 * 30) * applyResistanceAddEffect(player, target, xi.element.ICE, 0)
        -- paralyze proc based on lvl difference
        local power = 30 + (player:getMainLvl() - target:getMainLvl()) * 3
        if power > 35 then
            power = 35
        elseif power < 5 then
            power = 5
        end

        target:addStatusEffect(xi.effect.PARALYSIS, power, 0, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
