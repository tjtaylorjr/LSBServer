-----------------------------------
-- Area: Beaucedine Glacier (S)
--  NPC: Disserond, R.K.
-- Type: Campaign Arbiter
-- !pos 76.178 -60.763 -48.775 136
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(450)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
