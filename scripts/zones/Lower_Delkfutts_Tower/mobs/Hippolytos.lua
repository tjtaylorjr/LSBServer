-----------------------------------
-- Area: Lower Delkfutt's Tower
--   NM: Hippolytos
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 341)
end

return entity
