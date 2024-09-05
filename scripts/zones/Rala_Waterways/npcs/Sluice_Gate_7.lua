-----------------------------------
-- Area: Rala Waterways (258)
--  NPC: Sluice Gate #7 (Secret Hideout Exit)
-- !pos TODO 258
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(362)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
