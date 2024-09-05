-----------------------------------
-- Area: Windurst Waters
--  NPC: Zelala
-- Type: Map Marker
-- !pos 169.855 -1.295 -3.238 238
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(960)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
