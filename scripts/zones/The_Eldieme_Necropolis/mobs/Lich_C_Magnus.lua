-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Lich C Magnus
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.LICH_BANISHER)
end

return entity
