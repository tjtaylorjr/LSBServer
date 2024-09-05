-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Chaloutte
-- Type: Event Scene Replayer
-- !pos 10.450 -1 -11.985 233
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(557)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
