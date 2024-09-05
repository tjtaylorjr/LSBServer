-----------------------------------
-- Area: Windurst Woods
--  NPC: Dahjal
-- Type: Conquest Troupe
-- !pos 11.639 1.267 -57.706 241
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(48)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
