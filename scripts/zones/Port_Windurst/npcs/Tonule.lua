-----------------------------------
-- Area: Port Windurst
--  NPC: Tonule
-- Type: Event Replayer
-- !pos -209.385 -9.117 195.217 240
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(551)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
