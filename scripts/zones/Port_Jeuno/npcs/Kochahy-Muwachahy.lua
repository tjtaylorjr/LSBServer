-----------------------------------
-- Area: Port Jeuno
--  NPC: Kochahy-Muwachahy
-- !pos 40 0 6 246
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = xi.nation.OTHER
local guardType   = xi.conq.guard.CITY
local guardEvent  = 32763

entity.onTrade = function(player, npc, trade)
    xi.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

entity.onTrigger = function(player, npc)
    xi.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType)
end

return entity
