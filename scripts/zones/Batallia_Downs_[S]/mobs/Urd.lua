-----------------------------------
--  Mob: Urd
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    xi.voidwalker.onMobInitialize(mob)
end

entity.onMobSpawn = function(mob)
    xi.voidwalker.onMobSpawn(mob)
end

entity.onMobFight = function(mob, target)
    xi.voidwalker.onMobFight(mob, target)
end

entity.onMobDisengage = function(mob)
    xi.voidwalker.onMobDisengage(mob)
end

entity.onMobDespawn = function(mob)
    xi.voidwalker.onMobDespawn(mob)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.voidwalker.onMobDeath(mob, player, optParams, xi.keyItem.YELLOW_ABYSSITE)
    xi.hunts.checkHunt(mob, player, 554)
    xi.magian.onMobDeath(mob, player, optParams, set{ 222, 650, 716, 947 })
end

return entity
