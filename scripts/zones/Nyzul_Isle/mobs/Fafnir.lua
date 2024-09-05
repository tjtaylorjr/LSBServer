-----------------------------------
--  MOB: Fafnir
-- Area: Nyzul Isle
-- Info: Floor 20 and 40 Boss, Hurricane Wing is stronger than normal
-----------------------------------
mixins = { require('scripts/mixins/nyzul_boss_drops') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- Set Immunities.
    -- mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    -- mob:addImmunity(xi.immunity.DARK_SLEEP)
    -- mob:addImmunity(xi.immunity.TERROR)

    -- Set Mob Modifiers.
    -- mob:setMobMod(xi.mobMod.NO_MP, 1)
end

entity.onMobSpawn = function(mob)
    mob:addMod(xi.mod.ATT, 150)
    mob:addMod(xi.mod.DEF, 90)
    mob:setMod(xi.mod.MAIN_DMG_RATING, 33)
    mob:setMod(xi.mod.DOUBLE_ATTACK, 25)

    mob:setMobMod(xi.mobMod.ROAM_DISTANCE, 15)
end

entity.onMobFight = function(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        xi.nyzul.enemyLeaderKill(mob)
        xi.nyzul.vigilWeaponDrop(player, mob)
    end
end

return entity
