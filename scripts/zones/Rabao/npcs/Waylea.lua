-----------------------------------
-- Area: Rabao
--  NPC: Waylea
-- Type: Reputation
-- !pos 12.384 4.658 -32.392 247
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(57 + (player:getFameLevel(4) - 1))
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
