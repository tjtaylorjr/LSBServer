-----------------------------------
--  MOB: Vile Yabeewa
-- Area: Nyzul Isle
-- Info: Enemy Leader
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if optParams.isKiller or optParams.noKiller then
        xi.nyzul.spawnChest(mob, player)
        xi.nyzul.enemyLeaderKill(mob)
    end
end

return entity
