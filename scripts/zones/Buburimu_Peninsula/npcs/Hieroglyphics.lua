-----------------------------------
-- Area: Buburimu_Peninsula
--  NPC: Hieroglyphics
-- Dynamis Buburimu Enter
-- !pos 163 0 -174 118
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.dynamis.entryNpcOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.dynamis.entryNpcOnEventFinish(player, csid, option, npc)
end

return entity
