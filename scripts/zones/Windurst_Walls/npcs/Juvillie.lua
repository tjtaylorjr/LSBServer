-----------------------------------
-- Area: Windurst Walls
--  NPC: Juvillie
-- Type: Event Replayer
-- !pos -180.731 -3.451 143.138 239
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(406)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
