-----------------------------------
-- Area: Beaucedine Glacier (S)
--  NPC: Watchful Pixie
-- Type: Quest NPC
-- !pos -56.000 -1.3 -392.000 136
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(4002)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
