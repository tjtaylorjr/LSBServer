-----------------------------------
-- Wildfire
-- Skill Level: N/A
-- Description: Deals fire elemental damage. Enmity generation varies with TP. Armageddon: Aftermath.
-- Acquired permanently by completing the appropriate Walk of Echoes Weapon Skill Trials.
-- Can also be used by equipping Armageddon (85)/(90)/(95)/(99) or Bedlam +1/+2/+3.
-- Aligned with the Soil Gorget & Shadow Gorget.
-- Aligned with the Soil Belt & Shadow Belt.
-- Element: Fire
-- Skillchain Properties: Darkness/Gravitation
-- Modifiers: AGI:60%
-- Damage Multipliers by TP:
--  100%TP    200%TP    300%TP
--  5.5      5.5     5.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftpMod = { 5.5, 5.5, 5.5 }
    params.agi_wsc = 0.6
    params.ele = xi.element.FIRE
    params.skill = xi.skill.MARKSMANSHIP
    params.includemab = true

    -- TODO: needs to give enmity down at varying tp percent's that is treated separately than the gear cap of -50% enmity http://www.bg-wiki.com/bg/Wildfire

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.RANGED, xi.aftermath.type.EMPYREAN)

    local damage, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)

    return tpHits, extraHits, false, damage
end

return weaponskillObject
