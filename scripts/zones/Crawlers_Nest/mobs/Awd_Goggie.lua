-----------------------------------
-- Area: Crawlers' Nest
--  Mob: Awd Goggie
-- !pos -253.026 -1.867 253.055 197
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    player:addTitle(xi.title.BOGEYDOWNER)
end

return entity
