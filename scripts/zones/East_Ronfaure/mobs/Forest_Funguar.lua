-----------------------------------
-- Area: East Ronfaure
--  Mob: Forest Funguar
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 67, 2, xi.regime.type.FIELDS)
end

return entity
