-----------------------------------
-- Area: Port Windurst
--  NPC: Teruga-Boruga
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(335)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
