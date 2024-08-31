-----------------------------------
-- Spell: Cannonball
-- Damage varies with TP
-- Spell cost: 66 MP
-- Monster Type: Vermin
-- Spell Type: Physical (Blunt)
-- Blue Magic Points: 3
-- Stat Bonus: STR+1, DEX+1
-- Level: 70
-- Casting Time: 0.5 seconds
-- Recast Time: 28.5 seconds
-- Skillchain Element(s): Fusion
-- Combos: None
-----------------------------------
---@type TSpell
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    local params = {}
    params.ecosystem = xi.ecosystem.VERMIN
    params.tpmod = xi.spells.blue.tpMod.DAMAGE
    params.attackType = xi.attackType.PHYSICAL
    params.damageType = xi.damageType.BLUNT
    params.scattr = xi.skillchainType.FUSION
    params.numhits = 1
    params.multiplier = 1.75
    params.tp150 = 2.125
    params.tp300 = 2.75
    params.azuretp = 2.875
    params.duppercap = 75
    params.str_wsc = 0.5
    params.dex_wsc = 0.0
    params.vit_wsc = 0.5
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.offcratiomod = caster:getStat(xi.mod.DEF) -- Cannonball uses Defense as its main modifier

    return xi.spells.blue.usePhysicalSpell(caster, target, spell, params)
end

return spellObject
