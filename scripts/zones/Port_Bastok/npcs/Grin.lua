-----------------------------------
-- Area: Port Bastok
--  NPC: Grin
-- Type: Quest Giver
-- !pos -56.533 1.392 -29.432 236
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(295)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
