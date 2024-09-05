-----------------------------------
-- Area: Lower Jeuno
--  NPC: Chimh Dlesbah
-- Type: Event Scene Replayer
-- !pos -71.995 -1 -115.882 245
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(10096)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
