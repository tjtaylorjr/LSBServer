-----------------------------------
-- Area: Southern Sandoria
--  NPC: Estiliphire
-- Type: Event Sideshow NPC
-- !pos -41.550 1.999 -2.845 230
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(897)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
