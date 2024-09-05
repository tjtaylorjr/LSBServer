-----------------------------------
-- Area: Upper Jeuno
--  NPC: Mhao Kehtsoruho
-- Type: Past Event Watcher
-- !pos -73.032 -1 146.919 244
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(10173)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
