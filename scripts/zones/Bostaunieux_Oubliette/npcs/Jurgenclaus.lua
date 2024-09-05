-----------------------------------
-- Area: Bostaunieux Oubliette
--  NPC: Jurgenclaus
-- !pos 69.735 -24.989 7.741 167
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(18)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
