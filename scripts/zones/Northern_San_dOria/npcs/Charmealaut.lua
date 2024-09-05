-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Charmealaut
-- Type: Merchant
-- !pos 0.000 -0.501 29.303 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(768)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
