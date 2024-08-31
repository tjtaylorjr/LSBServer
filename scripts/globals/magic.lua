require('scripts/globals/combat/magic_hit_rate')
require('scripts/globals/jobpoints')
require('scripts/globals/magicburst')
require('scripts/globals/utils')
-----------------------------------
xi = xi or {}
xi.magic = xi.magic or {}

-----------------------------------
-- Day to Element Mapping
-----------------------------------

xi.magic.dayElement =
{
    [xi.day.FIRESDAY]     = xi.element.FIRE,
    [xi.day.ICEDAY]       = xi.element.ICE,
    [xi.day.WINDSDAY]     = xi.element.WIND,
    [xi.day.EARTHSDAY]    = xi.element.EARTH,
    [xi.day.LIGHTNINGDAY] = xi.element.THUNDER,
    [xi.day.WATERSDAY]    = xi.element.WATER,
    [xi.day.LIGHTSDAY]    = xi.element.LIGHT,
    [xi.day.DARKSDAY]     = xi.element.DARK,
}

-----------------------------------
-- Tables by element
-----------------------------------

xi.magic.dayStrong           = { xi.day.FIRESDAY,              xi.day.ICEDAY,               xi.day.WINDSDAY,               xi.day.EARTHSDAY,              xi.day.LIGHTNINGDAY,               xi.day.WATERSDAY,               xi.day.LIGHTSDAY,           xi.day.DARKSDAY }
xi.magic.singleWeatherStrong = { xi.weather.HOT_SPELL,         xi.weather.SNOW,             xi.weather.WIND,               xi.weather.DUST_STORM,         xi.weather.THUNDER,                xi.weather.RAIN,                xi.weather.AURORAS,         xi.weather.GLOOM }
xi.magic.doubleWeatherStrong = { xi.weather.HEAT_WAVE,         xi.weather.BLIZZARDS,        xi.weather.GALES,              xi.weather.SAND_STORM,         xi.weather.THUNDERSTORMS,          xi.weather.SQUALL,              xi.weather.STELLAR_GLARE,   xi.weather.DARKNESS }
local elementalObi           = { xi.mod.FORCE_FIRE_DWBONUS,    xi.mod.FORCE_ICE_DWBONUS,    xi.mod.FORCE_WIND_DWBONUS,     xi.mod.FORCE_EARTH_DWBONUS,    xi.mod.FORCE_LIGHTNING_DWBONUS,    xi.mod.FORCE_WATER_DWBONUS,     xi.mod.FORCE_LIGHT_DWBONUS, xi.mod.FORCE_DARK_DWBONUS }
local strongAffinityDmg      = { xi.mod.FIRE_AFFINITY_DMG,     xi.mod.ICE_AFFINITY_DMG,     xi.mod.WIND_AFFINITY_DMG,      xi.mod.EARTH_AFFINITY_DMG,     xi.mod.THUNDER_AFFINITY_DMG,       xi.mod.WATER_AFFINITY_DMG,      xi.mod.LIGHT_AFFINITY_DMG,  xi.mod.DARK_AFFINITY_DMG }
local strongAffinityAcc      = { xi.mod.FIRE_AFFINITY_ACC,     xi.mod.ICE_AFFINITY_ACC,     xi.mod.WIND_AFFINITY_ACC,      xi.mod.EARTH_AFFINITY_ACC,     xi.mod.THUNDER_AFFINITY_ACC,       xi.mod.WATER_AFFINITY_ACC,      xi.mod.LIGHT_AFFINITY_ACC,  xi.mod.DARK_AFFINITY_ACC }
xi.magic.resistMod           = { xi.mod.FIRE_MEVA,             xi.mod.ICE_MEVA,             xi.mod.WIND_MEVA,              xi.mod.EARTH_MEVA,             xi.mod.THUNDER_MEVA,               xi.mod.WATER_MEVA,              xi.mod.LIGHT_MEVA,          xi.mod.DARK_MEVA }
xi.magic.specificDmgTakenMod = { xi.mod.FIRE_SDT,              xi.mod.ICE_SDT,              xi.mod.WIND_SDT,               xi.mod.EARTH_SDT,              xi.mod.THUNDER_SDT,                xi.mod.WATER_SDT,               xi.mod.LIGHT_SDT,           xi.mod.DARK_SDT }
xi.magic.absorbMod           = { xi.mod.FIRE_ABSORB,           xi.mod.ICE_ABSORB,           xi.mod.WIND_ABSORB,            xi.mod.EARTH_ABSORB,           xi.mod.LTNG_ABSORB,                xi.mod.WATER_ABSORB,            xi.mod.LIGHT_ABSORB,        xi.mod.DARK_ABSORB }
local nullMod                = { xi.mod.FIRE_NULL,             xi.mod.ICE_NULL,             xi.mod.WIND_NULL,              xi.mod.EARTH_NULL,             xi.mod.LTNG_NULL,                  xi.mod.WATER_NULL,              xi.mod.LIGHT_NULL,          xi.mod.DARK_NULL }
local blmMerit               = { xi.merit.FIRE_MAGIC_POTENCY,  xi.merit.ICE_MAGIC_POTENCY,  xi.merit.WIND_MAGIC_POTENCY,   xi.merit.EARTH_MAGIC_POTENCY,  xi.merit.LIGHTNING_MAGIC_POTENCY,  xi.merit.WATER_MAGIC_POTENCY }
xi.magic.barSpell            = { xi.effect.BARFIRE,            xi.effect.BARBLIZZARD,       xi.effect.BARAERO,             xi.effect.BARSTONE,            xi.effect.BARTHUNDER,              xi.effect.BARWATER }

xi.magic.dayWeak             = { xi.day.WATERSDAY,             xi.day.FIRESDAY,             xi.day.ICEDAY,                 xi.day.WINDSDAY,               xi.day.EARTHSDAY,                  xi.day.LIGHTNINGDAY,            xi.day.DARKSDAY,            xi.day.LIGHTSDAY           }
xi.magic.singleWeatherWeak   = { xi.weather.RAIN,              xi.weather.HOT_SPELL,        xi.weather.SNOW,               xi.weather.WIND,               xi.weather.DUST_STORM,             xi.weather.THUNDER,             xi.weather.GLOOM,           xi.weather.AURORAS         }
xi.magic.doubleWeatherWeak   = { xi.weather.SQUALL,            xi.weather.HEAT_WAVE,        xi.weather.BLIZZARDS,          xi.weather.GALES,              xi.weather.SAND_STORM,             xi.weather.THUNDERSTORMS,       xi.weather.DARKNESS,        xi.weather.STELLAR_GLARE   }

local elementDescendant =
{
    [xi.element.FIRE   ] = xi.element.WATER,
    [xi.element.ICE    ] = xi.element.FIRE,
    [xi.element.WIND   ] = xi.element.ICE,
    [xi.element.EARTH  ] = xi.element.WIND,
    [xi.element.THUNDER] = xi.element.EARTH,
    [xi.element.WATER  ] = xi.element.THUNDER,
    [xi.element.LIGHT  ] = xi.element.DARK,
    [xi.element.DARK   ] = xi.element.LIGHT,
}

-- USED FOR DAMAGING MAGICAL SPELLS (Stages 1 and 2 in Calculating Magic Damage on wiki)
--Calculates magic damage using the standard magic damage calc.
--Does NOT handle resistance.
-- Inputs:
-- dmg - The base damage of the spell
-- multiplier - The INT multiplier of the spell
-- skilltype - The skill ID of the spell.
-- atttype - The attribute type (usually xi.mod.INT , except for things like Banish which is xi.mod.MND)
-- hasMultipleTargetReduction - true ifdamage is reduced on AoE. False otherwise (e.g. Charged Whisker vs -ga3 spells)
--
-- Output:
-- The total damage, before resistance and before equipment (so no HQ staff bonus worked out here).
local softCap = 60 --guesstimated
local hardCap = 120 --guesstimated

-----------------------------------
-- Returns the staff bonus for the caster and spell.
-----------------------------------
-- affinities that strengthen/weaken the index element
local function AffinityBonusDmg(caster, ele)
    local affinity = caster:getMod(strongAffinityDmg[ele])
    local bonus = 1.00 + affinity * 0.05 -- 5% per level of affinity
    return bonus
end

local function AffinityBonusAcc(caster, ele)
    local affinity = caster:getMod(strongAffinityAcc[ele])
    local bonus = 0 + affinity * 10 -- 10 acc per level of affinity
    return bonus
end

local function calculateMagicBurst(caster, spell, target, params)
    local burst           = 1
    local skillchainburst = 1
    local modburst        = 1

    if
        spell and
        spell:getSpellGroup() == xi.magic.spellGroup.BLUE
    then
        if
            not (caster:hasStatusEffect(xi.effect.BURST_AFFINITY) or
            caster:hasStatusEffect(xi.effect.AZURE_LORE))
        then
            return burst
        end

        caster:delStatusEffectSilent(xi.effect.BURST_AFFINITY)
    end

    -- Obtain first multiplier from gear, atma and job traits
    modburst = modburst + params.AMIIburstBonus + caster:getMod(xi.mod.MAGIC_BURST_BONUS_CAPPED) / 100

    if caster:isBehind(target) and caster:hasStatusEffect(xi.effect.INNIN) then
        modburst = modburst + caster:getMerit(xi.merit.INNIN_EFFECT) / 100
    end

    -- Cap bonuses from first multiplier at 40% or 1.4
    if modburst > 1.4 then
        modburst = 1.4
    end

    -- JP gifts
    modburst = modburst + caster:getMod(xi.mod.MAGIC_BURST_BONUS_UNCAPPED) / 100

    -- BLM Job Point: Magic Burst Damage
    modburst = modburst + caster:getJobPointLevel(xi.jp.MAGIC_BURST_DMG_BONUS) / 100

    -- Obtain second multiplier from skillchain
    -- Starts at 35% damage bonus, increases by 10% for every additional weaponskill in the chain
    local skillchainTier, skillchainCount = xi.magicburst.formMagicBurst(spell:getElement(), target)

    if skillchainTier > 0 then
        if skillchainCount == 1 then -- two weaponskills
            skillchainburst = 1.35
        elseif skillchainCount == 2 then -- three weaponskills
            skillchainburst = 1.45
        elseif skillchainCount == 3 then -- four weaponskills
            skillchainburst = 1.55
        elseif skillchainCount == 4 then -- five weaponskills
            skillchainburst = 1.65
        elseif skillchainCount == 5 then -- six weaponskills
            skillchainburst = 1.75
        else
            -- Something strange is going on if this occurs.
            skillchainburst = 1
        end
    else
        modburst = 1
    end

    -- Multiply
    burst = modburst * skillchainburst

    return burst
end

function calculateMagicDamage(caster, target, spell, params)
    local dINT = caster:getStat(params.attribute) - target:getStat(params.attribute)
    local dmg = params.dmg

    if dINT <= 0 then --if dINT penalises, it's always M=1
        dmg = dmg + dINT
        if dmg <= 0 then --dINT penalty cannot result in negative damage (target absorption)
            return 0
        end
    elseif dINT > 0 and dINT <= softCap then --The standard calc, most spells hit this
        dmg = dmg + (dINT * params.multiplier)
    elseif dINT > 0 and dINT > softCap and dINT < hardCap then --After softCap, INT is only half effective
        dmg = dmg + softCap * params.multiplier + ((dINT - softCap) * params.multiplier) / 2
    elseif dINT > 0 and dINT > softCap and dINT >= hardCap then --After hardCap, INT has no xi.effect.
        dmg = dmg + hardCap * params.multiplier
    end

    if params.skillType == xi.skill.DIVINE_MAGIC and target:isUndead() then
        -- 150% bonus damage
        dmg = dmg * 1.5
    end

    return dmg
end

function doEnspell(caster, target, spell, effect)
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    --calculate potency
    local magicskill = caster:getSkillLevel(xi.skill.ENHANCING_MAGIC)

    local potency = 3 + math.floor(6 * magicskill / 100)
    if magicskill > 200 then
        potency = 5 + math.floor(5 * magicskill / 100)
    end

    if target:addStatusEffect(effect, potency, 0, duration) then
        spell:setMsg(xi.msg.basic.MAGIC_GAIN_EFFECT)
    else
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
    end
end

-----------------------------------
--   getCurePower returns the caster's cure power
--   getCureFinal returns the final cure amount
--   Source: http://members.shaw.ca/pizza_steve/cure/Cure_Calculator.html
-----------------------------------
function getCurePower(caster, isBlueMagic)
    local mnd = caster:getStat(xi.mod.MND)
    local vit = caster:getStat(xi.mod.VIT)
    local skill = caster:getSkillLevel(xi.skill.HEALING_MAGIC)
    local power = math.floor(mnd / 2) + math.floor(vit / 4) + skill
    return power
end

function getCurePowerOld(caster)
    local mnd = caster:getStat(xi.mod.MND)
    local vit = caster:getStat(xi.mod.VIT)
    local skill = caster:getSkillLevel(xi.skill.HEALING_MAGIC) -- it's healing magic skill for the BLU cures as well
    local power = (3 * mnd) + vit + (3 * math.floor(skill / 5))
    return power
end

function getBaseCure(power, divisor, constant, basepower)
    return ((power - basepower) / divisor) + constant
end

function getBaseCureOld(power, divisor, constant)
    return (power / 2) / divisor + constant
end

function getCureFinal(caster, spell, basecure, minCure, isBlueMagic)
    if basecure < minCure then
        basecure = minCure
    end

    local curePot = math.min(caster:getMod(xi.mod.CURE_POTENCY), 50) / 100 -- caps at 50%
    local curePotII = math.min(caster:getMod(xi.mod.CURE_POTENCY_II), 30) / 100 -- caps at 30%
    local potency = 1 + curePot + curePotII

    local dSeal = 1
    if caster:hasStatusEffect(xi.effect.DIVINE_SEAL) then
        dSeal = 2
    end

    local rapture = 1
    if not isBlueMagic then --rapture doesn't affect BLU cures as they're not white magic
        if caster:hasStatusEffect(xi.effect.RAPTURE) then
            rapture = 1.5 + caster:getMod(xi.mod.RAPTURE_AMOUNT) / 100
            caster:delStatusEffectSilent(xi.effect.RAPTURE)
        end
    end

    local dayWeatherBonus = 1
    local spellElement    = spell:getElement()
    local castersWeather  = caster:getWeather()

    -- Calculate Weather bonus + Iridescence bonus.
    if
        math.random(1, 100) <= 33 or
        caster:getMod(elementalObi[spellElement]) >= 1
    then
        -- Strong weathers.
        if castersWeather == xi.magic.singleWeatherStrong[spellElement] then
            dayWeatherBonus = dayWeatherBonus + 0.1 + caster:getMod(xi.mod.IRIDESCENCE) * 0.05
        elseif castersWeather == xi.magic.doubleWeatherStrong[spellElement] then
            dayWeatherBonus = dayWeatherBonus + 0.25 + caster:getMod(xi.mod.IRIDESCENCE) * 0.05

        -- Weak weathers.
        elseif castersWeather == xi.magic.singleWeatherWeak[spellElement] then
            dayWeatherBonus = dayWeatherBonus - 0.1 - caster:getMod(xi.mod.IRIDESCENCE) * 0.05
        elseif castersWeather == xi.magic.doubleWeatherWeak[spellElement] then
            dayWeatherBonus = dayWeatherBonus - 0.25 - caster:getMod(xi.mod.IRIDESCENCE) * 0.05
        end
    end

    -- Calculate day element bonus.
    local dayElement = VanadielDayElement()

    if
        math.random(1, 100) <= 33 or
        caster:getMod(elementalObi[spellElement]) >= 1
    then
        if dayElement == spellElement then
            dayWeatherBonus = dayWeatherBonus + 0.10
        elseif dayElement == elementDescendant[spellElement] then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    if dayWeatherBonus > 1.4 then
        dayWeatherBonus = 1.4
    end

    -- Floor and return.
    local final = math.floor(basecure)
    final       = math.floor(final * potency)
    final       = math.floor(final * dayWeatherBonus)
    final       = math.floor(final * rapture)
    final       = math.floor(final * dSeal)

    return final
end

function isValidHealTarget(caster, target)
    return target:getAllegiance() == caster:getAllegiance() and
            (target:getObjType() == xi.objType.PC or
            target:getObjType() == xi.objType.MOB or
            target:getObjType() == xi.objType.TRUST or
            target:getObjType() == xi.objType.FELLOW)
end

-- USED FOR DAMAGING MAGICAL SPELLS. Stage 3 of Calculating Magic Damage on wiki
-- Reduces damage ifit resists.
--
-- Output:
-- The factor to multiply down damage (1/2 1/4 1/8 1/16) - In this format so this func can be used for enfeebs on duration.
-- USED FOR Status Effect Enfeebs (blind, slow, para, etc.)
-- Output:
-- The factor to multiply down duration (1/2 1/4 1/8 1/16)
--[[
local params = {}
params.attribute = $2
params.skillType = $3
params.bonus = $4
params.effect = $5
]]

-- TODO: This must be destroyed
function applyResistanceEffect(actor, target, spell, params)
    local spellFamily = spell:getSpellFamily() or 0
    local skillType   = params.skillType or 0
    local element     = spell:getElement() or 0
    local statUsed    = params.attribute or 0
    local bonusMacc   = params.bonus or 0

    -- GUESS stat if it isnt fed with params.
    if statUsed == 0 then
        if skillType == xi.skill.SINGING then
            statUsed = xi.mod.CHR
        else
            statUsed = xi.mod.INT
        end
    end

    -- Is enfeeble?
    local isEnfeeble = false
    local effect     = params.effect or 0
    if effect > 0 then
        isEnfeeble  = true
    end

    -- TODO: Convert enfeebling songs.
    local magicAcc     = xi.combat.magicHitRate.calculateActorMagicAccuracy(actor, target, spellFamily, skillType, element, statUsed, bonusMacc)
    local magicEva     = xi.combat.magicHitRate.calculateTargetMagicEvasion(actor, target, element, isEnfeeble, 0, 0) -- true = Is an enfeeble.
    local magicHitRate = xi.combat.magicHitRate.calculateMagicHitRate(magicAcc, magicEva)
    local resistRate   = xi.combat.magicHitRate.calculateResistRate(actor, target, skillType, element, magicHitRate, 0)

    return resistRate
end

-- Applies resistance for things that may not be spells - ie. Quick Draw
function applyResistanceAbility(actor, target, element, skillType, bonusMacc)
    local magicAcc     = xi.combat.magicHitRate.calculateNonSpellMagicAccuracy(actor, target, 0, skillType, element, bonusMacc)
    local magicEva     = xi.combat.magicHitRate.calculateTargetMagicEvasion(actor, target, element, false, 0, 0) -- false = not an enfeeble.
    local magicHitRate = xi.combat.magicHitRate.calculateMagicHitRate(magicAcc, magicEva)
    local resistRate   = xi.combat.magicHitRate.calculateResistRate(actor, target, skillType, element, magicHitRate, 0)

    return resistRate
end

-- Applies resistance for additional effects
function applyResistanceAddEffect(actor, target, element, bonusMacc)
    local magicAcc     = xi.combat.magicHitRate.calculateNonSpellMagicAccuracy(actor, target, 0, xi.skill.NONE, element, bonusMacc)
    local magicEva     = xi.combat.magicHitRate.calculateTargetMagicEvasion(actor, target, element, false, 0, 0) -- false = not an enfeeble.
    local magicHitRate = xi.combat.magicHitRate.calculateMagicHitRate(magicAcc, magicEva)
    local resistRate   = xi.combat.magicHitRate.calculateResistRate(actor, target, xi.skill.NONE, element, magicHitRate, 0)

    return resistRate
end

-- Returns the amount of resistance the target has to the given effect
local effectToResistanceMod =
{
    [xi.effect.SLEEP_I      ] = xi.mod.SLEEPRES,
    [xi.effect.SLEEP_II     ] = xi.mod.SLEEPRES,
    [xi.effect.LULLABY      ] = xi.mod.SLEEPRES,
    [xi.effect.POISON       ] = xi.mod.POISONRES,
    [xi.effect.PARALYSIS    ] = xi.mod.PARALYZERES,
    [xi.effect.BLINDNESS    ] = xi.mod.BLINDRES,
    [xi.effect.SILENCE      ] = xi.mod.SILENCERES,
    [xi.effect.PLAGUE       ] = xi.mod.VIRUSRES,
    [xi.effect.DISEASE      ] = xi.mod.VIRUSRES,
    [xi.effect.PETRIFICATION] = xi.mod.PETRIFYRES,
    [xi.effect.BIND         ] = xi.mod.BINDRES,
    [xi.effect.CURSE_I      ] = xi.mod.CURSERES,
    [xi.effect.CURSE_II     ] = xi.mod.CURSERES,
    [xi.effect.BANE         ] = xi.mod.CURSERES,
    [xi.effect.WEIGHT       ] = xi.mod.GRAVITYRES,
    [xi.effect.SLOW         ] = xi.mod.SLOWRES,
    [xi.effect.ELEGY        ] = xi.mod.SLOWRES,
    [xi.effect.STUN         ] = xi.mod.STUNRES,
    [xi.effect.CHARM_I      ] = xi.mod.CHARMRES,
    [xi.effect.CHARM_II     ] = xi.mod.CHARMRES,
    [xi.effect.AMNESIA      ] = xi.mod.AMNESIARES,
}

xi.magic.getEffectResistance = function(target, effectId)
    local statusResistance = target:getMod(xi.mod.STATUSRES)

    if effectToResistanceMod[effectId] then
        statusResistance = statusResistance + target:getMod(effectToResistanceMod[effectId])
    end

    return statusResistance
end

function finalMagicAdjustments(caster, target, spell, dmg)
    --Handles target's HP adjustment and returns UNSIGNED dmg (absorb message is set in this function)

    -- handle multiple targets
    if caster:isSpellAoE(spell:getID()) then
        local total = spell:getTotalTargets()

        if total > 9 then
            -- ga spells on 10+ targets = 0.4
            dmg = dmg * 0.4
        elseif total > 1 then
            -- -ga spells on 2 to 9 targets = 0.9 - 0.05T where T = number of targets
            dmg = dmg * (0.9 - 0.05 * total)
        end

        -- kill shadows
        -- target:delStatusEffect(xi.effect.COPY_IMAGE)
        -- target:delStatusEffect(xi.effect.BLINK)
    else
        -- this logic will eventually be moved here
        -- dmg = utils.takeShadows(target, dmg, 1)

        -- if (dmg == 0) then
            -- spell:setMsg(xi.msg.basic.SHADOW_ABSORB)
            -- return 1
        -- end
    end

    local skill = spell:getSkillType()
    if skill == xi.skill.ELEMENTAL_MAGIC then
        dmg = dmg * xi.settings.main.ELEMENTAL_POWER
    elseif skill == xi.skill.DARK_MAGIC then
        dmg = dmg * xi.settings.main.DARK_POWER
    elseif skill == xi.skill.NINJUTSU then
        dmg = dmg * xi.settings.main.NINJUTSU_POWER
    elseif skill == xi.skill.DIVINE_MAGIC then
        dmg = dmg * xi.settings.main.DIVINE_POWER
    end

    dmg = target:magicDmgTaken(dmg)

    if dmg > 0 then
        dmg = dmg - target:getMod(xi.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    -- handle one for all
    dmg = utils.oneforall(target, dmg)

    --handling stoneskin
    dmg = utils.stoneskin(target, dmg)
    dmg = utils.clamp(dmg, -99999, 99999)

    if dmg < 0 then
        dmg = target:addHP(-dmg)
        spell:setMsg(xi.msg.basic.MAGIC_RECOVERS_HP)
    else
        -- Check if the mob has a damage cap
        dmg = target:checkDamageCap(dmg)

        -- Handle Bind break and TP?
        target:takeSpellDamage(caster, spell, dmg, xi.attackType.MAGICAL, xi.damageType.ELEMENTAL + spell:getElement())

        -- Handle Afflatus Misery.
        target:handleAfflatusMiseryDamage(dmg)

        -- Handle Enmity.
        target:updateEnmityFromDamage(caster, dmg)
    end

    return dmg
end

function finalMagicNonSpellAdjustments(caster, target, ele, dmg)
    -- Handles target's HP adjustment and returns SIGNED dmg (negative values on absorb)

    dmg = target:magicDmgTaken(dmg)

    if dmg > 0 then
        dmg = dmg - target:getMod(xi.mod.PHALANX)
        dmg = utils.clamp(dmg, 0, 99999)
    end

    -- handle one for all
    dmg = utils.oneforall(target, dmg)

    -- handling stoneskin
    dmg = utils.stoneskin(target, dmg)

    dmg = utils.clamp(dmg, -99999, 99999)

    if dmg < 0 then
        dmg = -(target:addHP(-dmg))
    else
        target:takeDamage(dmg, caster, xi.attackType.MAGICAL, xi.damageType.ELEMENTAL + ele)
    end

    -- Not updating enmity from damage, as this is primarily used for additional effects (which don't generate emnity)
    --  in the case that updating enmity is needed, do it manually after calling this
    -- target:updateEnmityFromDamage(caster, dmg)

    return dmg
end

function adjustForTarget(target, dmg, ele)
    if dmg > 0 and math.random(0, 99) < target:getMod(xi.magic.absorbMod[ele]) then
        return -dmg
    end

    if math.random(0, 99) < target:getMod(nullMod[ele]) then
        return 0
    end

    --Moved non element specific absorb and null mod checks to core
    --TODO: update all lua calls to magicDmgTaken with appropriate element and remove this function
    return dmg
end

function addBonuses(caster, spell, target, dmg, params)
    local ele = spell:getElement()
    local affinityBonus = AffinityBonusDmg(caster, ele)
    local magicDefense = getElementalDamageReduction(target, ele)
    local dayWeatherBonus = 1.00
    local weather = caster:getWeather()
    local casterJob = caster:getMainJob()

    params = params or {}
    params.bonusmab = params.bonusmab or 0
    params.AMIIburstBonus = params.AMIIburstBonus or 0

    dmg = math.floor(dmg * affinityBonus)
    dmg = math.floor(dmg * magicDefense)

    local dayWeatherBonusCheck = math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1

    if dayWeatherBonusCheck then
        if weather == xi.magic.singleWeatherStrong[ele] then
            if caster:getMod(xi.mod.IRIDESCENCE) >= 1 then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end

            dayWeatherBonus = dayWeatherBonus + 0.10
        elseif caster:getWeather() == xi.magic.singleWeatherWeak[ele] then
            dayWeatherBonus = dayWeatherBonus - 0.10
        elseif weather == xi.magic.doubleWeatherStrong[ele] then
            if caster:getMod(xi.mod.IRIDESCENCE) >= 1 then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end

            dayWeatherBonus = dayWeatherBonus + 0.25
        elseif weather == xi.magic.doubleWeatherWeak[ele] then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    local dayElement = VanadielDayElement()
    if dayElement == ele then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(xi.mod.DAY_NUKE_BONUS) / 100 -- sorc. tonban(+1)/zodiac ring
        if dayWeatherBonusCheck then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif dayElement == elementDescendant[ele] then
        if dayWeatherBonusCheck then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    dayWeatherBonus = math.min(dayWeatherBonus, 1.4)

    dmg = math.floor(dmg * dayWeatherBonus)

    local burst = calculateMagicBurst(caster, spell, target, params)

    if burst > 1.0 then
        spell:setMsg(spell:getMagicBurstMessage()) -- "Magic Burst!"

        caster:triggerRoeEvent(xi.roeTrigger.MAGIC_BURST)
    end

    dmg = math.floor(dmg * burst)
    local mabbonus
    local spellId = spell:getID()

    if spellId >= 245 and spellId <= 248 then -- Drain/Aspir (II)
        mabbonus = 1 + caster:getMod(xi.mod.ENH_DRAIN_ASPIR) / 100

        if spellId == 247 or spellId == 248 then
            mabbonus = mabbonus + caster:getMerit(xi.merit.ASPIR_ABSORPTION_AMOUNT) / 100
        end
    else
        local mab = caster:getMod(xi.mod.MATT) + params.bonusmab

        if spell:getSkillType() == xi.skill.NINJUTSU then
            mab = mab + caster:getMerit(xi.merit.NIN_MAGIC_BONUS)
        end

        if math.random(1, 100) < caster:getMod(xi.mod.MAGIC_CRITHITRATE) then
            mab = mab + (10 + caster:getMod(xi.mod.MAGIC_CRIT_DMG_INCREASE))
        end

        local mdefBarBonus = 0
        if ele >= xi.element.FIRE and ele <= xi.element.WATER then
            mab = mab + caster:getMerit(blmMerit[ele])
            if target:hasStatusEffect(xi.magic.barSpell[ele]) then -- bar- spell magic defense bonus
                mdefBarBonus = target:getStatusEffect(xi.magic.barSpell[ele]):getSubPower()
            end
        end

        if casterJob == xi.job.RDM then
            mab = mab + caster:getJobPointLevel(xi.jp.RDM_MAGIC_ATK_BONUS)
        elseif casterJob == xi.job.GEO then
            mab = mab + caster:getJobPointLevel(xi.jp.GEO_MAGIC_ATK_BONUS)
        end

        mabbonus = (100 + mab) / (100 + target:getMod(xi.mod.MDEF) + mdefBarBonus)
    end

    mabbonus = math.max(0, mabbonus)
    dmg = math.floor(dmg * mabbonus)

    if caster:hasStatusEffect(xi.effect.EBULLIENCE) then
        dmg = dmg * (1.2 + caster:getMod(xi.mod.EBULLIENCE_AMOUNT) / 100)
        caster:delStatusEffectSilent(xi.effect.EBULLIENCE)
    end

    dmg = math.floor(dmg)

    return dmg
end

function addBonusesAbility(caster, ele, target, dmg, params)
    local affinityBonus = AffinityBonusDmg(caster, ele)
    dmg = math.floor(dmg * affinityBonus)

    local magicDefense = getElementalDamageReduction(target, ele)
    dmg = math.floor(dmg * magicDefense)

    local dayWeatherBonus = 1.00
    local weather = caster:getWeather()

    if math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 then
        if weather == xi.magic.singleWeatherStrong[ele] then
            if caster:getMod(xi.mod.IRIDESCENCE) >= 1 then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end

            dayWeatherBonus = dayWeatherBonus + 0.10
        elseif caster:getWeather() == xi.magic.singleWeatherWeak[ele] then
            dayWeatherBonus = dayWeatherBonus - 0.10
        elseif weather == xi.magic.doubleWeatherStrong[ele] then
            if caster:getMod(xi.mod.IRIDESCENCE) >= 1 then
                dayWeatherBonus = dayWeatherBonus + 0.10
            end

            dayWeatherBonus = dayWeatherBonus + 0.25
        elseif weather == xi.magic.doubleWeatherWeak[ele] then
            dayWeatherBonus = dayWeatherBonus - 0.25
        end
    end

    local dayElement = VanadielDayElement()
    if dayElement == ele then
        dayWeatherBonus = dayWeatherBonus + caster:getMod(xi.mod.DAY_NUKE_BONUS) / 100 -- sorc. tonban(+1)/zodiac ring
        if math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 then
            dayWeatherBonus = dayWeatherBonus + 0.10
        end
    elseif dayElement == elementDescendant[ele] then
        if math.random() < 0.33 or caster:getMod(elementalObi[ele]) >= 1 then
            dayWeatherBonus = dayWeatherBonus - 0.10
        end
    end

    dayWeatherBonus = math.min(dayWeatherBonus, 1.4)

    dmg = math.floor(dmg * dayWeatherBonus)

    local mab = 1
    local mdefBarBonus = 0
    if
        ele >= xi.element.FIRE and
        ele <= xi.element.WATER and
        target:hasStatusEffect(xi.magic.barSpell[ele])
    then -- bar- spell magic defense bonus
        mdefBarBonus = target:getStatusEffect(xi.magic.barSpell[ele]):getSubPower()
    end

    if params ~= nil and params.bonusmab ~= nil and params.includemab then
        mab = (100 + caster:getMod(xi.mod.MATT) + params.bonusmab) / (100 + target:getMod(xi.mod.MDEF) + mdefBarBonus)
    elseif params == nil or (params ~= nil and params.includemab) then
        mab = (100 + caster:getMod(xi.mod.MATT)) / (100 + target:getMod(xi.mod.MDEF) + mdefBarBonus)
    end

    if mab < 0 then
        mab = 0
    end

    dmg = math.floor(dmg * mab)

    return dmg
end

-- get elemental damage reduction
function getElementalDamageReduction(target, element)
    local defense = 1
    if element > 0 then
        defense = 1 - (target:getMod(xi.magic.specificDmgTakenMod[element]) / 10000)
        return utils.clamp(defense, 0.0, 2.0)
    end

    return defense
end

function handleThrenody(caster, target, spell, basePower, baseDuration, modifier)
    -- Process resitances
    local staff  = AffinityBonusAcc(caster, spell:getElement())
    local params = {}

    params.attribute = xi.mod.CHR
    params.skillType = xi.skill.SINGING
    params.bonus = staff

    local resm = applyResistanceEffect(caster, target, spell, params)

    if resm < 0.5 then
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
        return xi.effect.THRENODY
    end

    -- Remove previous Threnody
    target:delStatusEffect(xi.effect.THRENODY)

    local iBoost = caster:getMod(xi.mod.THRENODY_EFFECT) + caster:getMod(xi.mod.ALL_SONGS_EFFECT)
    local power = basePower + iBoost * 5
    local duration = baseDuration * ((iBoost * 0.1) + (caster:getMod(xi.mod.SONG_DURATION_BONUS) / 100) + 1)

    if caster:hasStatusEffect(xi.effect.SOUL_VOICE) then
        power = power * 2
    elseif caster:hasStatusEffect(xi.effect.MARCATO) then
        power = power * 1.5
    end

    if caster:hasStatusEffect(xi.effect.TROUBADOUR) then
        duration = duration * 2
    end

    -- Set spell message and apply status effect
    target:addStatusEffect(xi.effect.THRENODY, -power, 0, duration, 0, modifier, 0)

    return xi.effect.THRENODY
end

function calculateDuration(duration, magicSkill, spellGroup, caster, target, useComposure)
    local casterJob = caster:getMainJob()

    if magicSkill == xi.skill.ENHANCING_MAGIC then -- Enhancing Magic
        -- Gear mods
        duration = duration + duration * caster:getMod(xi.mod.ENH_MAGIC_DURATION) / 100

        -- prior according to bg-wiki
        if casterJob == xi.job.RDM then
            duration = duration + caster:getMerit(xi.merit.ENHANCING_MAGIC_DURATION) + caster:getJobPointLevel(xi.jp.ENHANCING_DURATION)
        end

        -- Default is true
        useComposure = useComposure or (useComposure == nil and true)

        -- Composure
        if
            useComposure and
            caster:hasStatusEffect(xi.effect.COMPOSURE) and
            caster:getID() == target:getID()
        then
            duration = duration * 3
        end

        -- Perpetuance
        if
            caster:hasStatusEffect(xi.effect.PERPETUANCE) and
            spellGroup == xi.magic.spellGroup.WHITE
        then
            duration  = duration * 2
        end
    elseif magicSkill == xi.skill.ENFEEBLING_MAGIC then -- Enfeebling Magic
        if caster:hasStatusEffect(xi.effect.SABOTEUR) then
            if target:isNM() then
                duration = duration * 1.25
            else
                duration = duration * 2
            end
        end

        -- After Saboteur according to bg-wiki
        if casterJob == xi.job.RDM then
            -- RDM Merit: Enfeebling Magic Duration
            duration = duration + caster:getMerit(xi.merit.ENFEEBLING_MAGIC_DURATION)

            -- RDM Job Point: Enfeebling Magic Duration
            duration = duration + caster:getJobPointLevel(xi.jp.ENFEEBLE_DURATION)

            -- RDM Job Point: Stymie effect
            if caster:hasStatusEffect(xi.effect.STYMIE) then
                duration = duration + caster:getJobPointLevel(xi.jp.STYMIE_EFFECT)
            end
        end
    elseif magicSkill == xi.skill.DARK_MAGIC then
        duration = duration * (1 + (caster:getMod(xi.mod.DARK_MAGIC_DURATION) / 100))
    end

    return math.floor(duration)
end
