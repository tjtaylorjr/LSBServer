-----------------------------------
-- Area: Rabao
--  NPC: Mileon
-- Type: Lucky Roll Gambler
-- !pos 26.080 8.201 65.297 247
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(100)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
