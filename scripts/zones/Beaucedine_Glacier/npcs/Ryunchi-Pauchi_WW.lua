-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Ryunchi-Pauchi, W.W.
-- Type: Outpost Conquest Guards
-- !pos -24.351 -60.421 -114.215 111
-----------------------------------
---@type TNpcEntity
local entity = {}

local guardNation = xi.nation.WINDURST
local guardType   = xi.conq.guard.OUTPOST
local guardRegion = xi.region.FAUREGANDI
local guardEvent  = 32759

entity.onTrade = function(player, npc, trade)
    xi.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

entity.onTrigger = function(player, npc)
    xi.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end

return entity
