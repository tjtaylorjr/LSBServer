-----------------------------------
-- Area: Beaucedine Glacier [S]
--  Mob: Ruszor
-----------------------------------
mixins = { require('scripts/mixins/families/ruszor') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
