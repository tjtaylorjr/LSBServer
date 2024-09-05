-----------------------------------
-- Area: Windurst Walls
--  NPC: Shinchai-Tocchai
-- Type: Moghouse Renter
-- !pos -220.551 -0.001 -116.916 239
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(505)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
