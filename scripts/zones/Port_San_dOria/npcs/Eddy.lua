-----------------------------------
-- Area: Port San d'Oria
--  NPC: Eddy
-- Type: NPC Quest Giver
-- !pos -5.209 -8.999 39.833 232
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(723)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
