-----------------------------------
-- Area: The Eldieme Necropolis [S] (175)
--  Mob: Poroggo Servant
-----------------------------------
mixins = { require('scripts/mixins/families/poroggo') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

return entity
