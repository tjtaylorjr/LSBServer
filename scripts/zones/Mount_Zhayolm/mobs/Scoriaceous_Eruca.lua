-----------------------------------
-- Area: Mount Zhayolm
--  Mob: Scoriaceous Eruca
-----------------------------------
mixins = { require('scripts/mixins/families/eruca') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
end

return entity
