-----------------------------------
--  VNM: Lord Ruthven
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
    player:addTitle(xi.title.RUTHVEN_ENTOMBER)
    xi.voidwalker.onMobDeath(mob, player, optParams, xi.keyItem.BLACK_ABYSSITE)
    xi.hunts.checkHunt(mob, player, 556)
end

return entity
