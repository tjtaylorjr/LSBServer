-----------------------------------
-- Area: Windurst Waters
--  NPC: Olaky-Yayulaky
-- Type: Item Depository
-- !pos -61.247 -4.5 72.551 238
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(910)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
