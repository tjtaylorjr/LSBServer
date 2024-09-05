-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Medicine Axe
-- Type: Outpost Vendor
-- !pos 144 -7 104 103
-----------------------------------
---@type TNpcEntity
local entity = {}

local vendorRegion  = xi.region.ZULKHEIM
local vendorEvent   = 32756

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.conquest.vendorOnTrigger(player, vendorRegion, vendorEvent)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.conquest.vendorOnEventUpdate(player, vendorRegion)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.conquest.vendorOnEventFinish(player, option, vendorRegion)
end

return entity
