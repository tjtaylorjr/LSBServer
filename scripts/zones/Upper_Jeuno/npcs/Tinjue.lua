-----------------------------------
-- Area: Upper Jeuno
--  NPC: Tinjue
-- Type: Past Event Watcher
-- !pos -73.790 -1 148.181 244
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(10010)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
