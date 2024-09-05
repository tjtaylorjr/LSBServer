-----------------------------------
-- Area: Selbina
--  NPC: Explorer Moogle
-----------------------------------
---@type TNpcEntity
local entity = {}

local eventId = 1135

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.teleport.explorerMoogleOnTrigger(player, eventId)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.teleport.explorerMoogleOnEventFinish(player, csid, option, eventId)
end

return entity
