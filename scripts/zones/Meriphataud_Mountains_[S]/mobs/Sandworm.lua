-----------------------------------
-- Area: Meriphataud Mountains [S]
--  Mob: Sandworm
-- Note: Title Given if Sandworm does not Doomvoid
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.SANDWORM_WRANGLER)
end

return entity
