-----------------------------------
-- Area: Windurst Waters
--  NPC: Pursuivant
-- Type: Pursuivant
-- !pos 113.971 -3.077 51.524 238
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(870)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
