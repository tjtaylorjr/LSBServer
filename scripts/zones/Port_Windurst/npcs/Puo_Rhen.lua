-----------------------------------
-- Area: Port Windurst
--  NPC: Puo Rhen
-- Type: Mission Starter
-- !pos -227.964 -9 187.087 240
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(72)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
