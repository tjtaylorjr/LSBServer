-----------------------------------
-- Area: Windurst Woods
--  NPC: Abby Jalunshi
-- Type: Moghouse Renter
-- !pos -101.895 -5 36.172 241
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(798)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
