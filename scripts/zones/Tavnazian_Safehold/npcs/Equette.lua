-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Equette
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- With no quests completed, first time in Safehold, 170, then after defaults to 162
    player:startEvent(162)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
