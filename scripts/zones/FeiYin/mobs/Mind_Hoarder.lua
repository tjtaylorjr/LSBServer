-----------------------------------
-- Area: Fei'Yin
--  NM: Mind Hoarder
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 347)
end

return entity
