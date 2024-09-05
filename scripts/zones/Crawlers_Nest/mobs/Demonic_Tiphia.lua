-----------------------------------
-- Area: Crawlers' Nest (197)
--  Mob: Demonic Tiphia
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 236)
end

return entity
