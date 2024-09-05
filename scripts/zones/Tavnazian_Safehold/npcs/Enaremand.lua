-----------------------------------
-- Area: Tavnazian Safehold
--  NPC: Enaremand
-- !pos 95.962 -42.003 51.613 26
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(537)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
