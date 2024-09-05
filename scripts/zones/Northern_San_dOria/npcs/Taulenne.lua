-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Taulenne
-- Armor Storage NPC
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.armorStorage.onTrade(player, trade, 772)
end

entity.onTrigger = function(player, npc)
    xi.armorStorage.onTrigger(player, 773)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.armorStorage.onEventUpdate(player, csid, option, 773)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.armorStorage.onEventFinish(player, csid, option, 772, 773)
end

return entity
