-----------------------------------
--  MOB: Amikiri
-- Area: Nyzul Isle
-- Info: NM
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    -- Set Immunities.
    -- mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    -- mob:addImmunity(xi.immunity.DARK_SLEEP)

    -- Set Mob Modifiers.
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
end

entity.onAdditionalEffect = function(mob, target, damage)
    return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.POISON, { chance = 40, tick = 50, duration = 15 })
end

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.eliminateAllKill(mob)
    end
end

return entity
