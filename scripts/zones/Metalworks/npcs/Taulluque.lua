-----------------------------------
-- Area: Metalworks
--  NPC: Taulluque
-- Type: Past Event Watcher
-- !pos 39.907 -14.999 -21.083 237
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(771)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
