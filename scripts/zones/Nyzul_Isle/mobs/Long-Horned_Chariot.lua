-----------------------------------
--  MOB: Long Horned Chariot
-- Area: Nyzul Isle
-- Info: Enemy Leader, Uses Brainjack
-----------------------------------
mixins = { require('scripts/mixins/families/chariot') }
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
