-----------------------------------
--  MOB: Archaic Gear
-- Area: Nyzul Isle
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    xi.nyzul.onGearEngage(mob, target)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.nyzul.onGearDeath(mob, player, optParams)
end

return entity
