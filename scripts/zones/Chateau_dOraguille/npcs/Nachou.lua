-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Nachou
-- !pos -39.965 -3.999 34.292 233
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(523)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
