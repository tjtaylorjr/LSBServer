-----------------------------------
-- Area: Windurst Waters
--  NPC: Panna-Donna
-- Type: Mission NPC
-- !pos -57.502 -6 229.571 238
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(105)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
