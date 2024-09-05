-----------------------------------
-- Area: Beaucedine Glacier (S)
--  NPC: Moana, C.A.
-- Type: Campaign Arbiter
-- !pos -27.237 -60.888 -48.111 136
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(453)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
