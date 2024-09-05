-----------------------------------
-- Area: Chocobo Circuit
--  NPC: Dealer Moogle
-- !pos -307.558 0.000 -480.407 70
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.dealerMoogle.onTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.dealerMoogle.onTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.dealerMoogle.onEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.dealerMoogle.onEventFinish(player, csid, option, npc)
end

return entity
