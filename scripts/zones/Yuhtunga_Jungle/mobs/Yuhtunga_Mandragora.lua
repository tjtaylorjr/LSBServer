-----------------------------------
-- Area: Yuhtunga Jungle
--  Mob: Yuhtunga Mandragora
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 124, 1, xi.regime.type.FIELDS)
end

return entity
