-----------------------------------
-- Area: North Gustaberg [S]
--   NM: Peaseblossom
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 501)
end

return entity
