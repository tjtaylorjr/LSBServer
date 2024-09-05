-----------------------------------
-- Area: Balga's Dais
--  Mob: Black Dragon
-- Mission 2-3 BCNM Fight
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.DRAW_IN, 1)
end

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.BLACK_DRAGON_SLAYER)
end

return entity
