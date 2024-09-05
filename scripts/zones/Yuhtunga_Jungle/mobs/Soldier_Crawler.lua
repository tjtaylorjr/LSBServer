-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Soldier Crawler
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 128, 2, xi.regime.type.FIELDS)
end

return entity
