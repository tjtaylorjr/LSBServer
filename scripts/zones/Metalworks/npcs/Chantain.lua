-----------------------------------
-- Area: Metalworks
--  NPC: Chantain
-- Type: Consulate Representative
-- !pos 21.729 -17 -30.888 237
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(203)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
