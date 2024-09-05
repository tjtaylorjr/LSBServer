-----------------------------------
-- Area: Oldton Movalpolos
--   NM: Bugbear Muscleman
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    -- Very fast TP gain or auto-TP/Regain. Can and will use Earthshock every 5-6 seconds regardless of TP fed.
    mob:addMod(xi.mod.REGAIN, 400)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 246)
end

return entity
