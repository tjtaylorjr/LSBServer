-----------------------------------
-- Area: Dynamis-Qufim
--  NPC: ??? (qm3)
-- Note: Spawns Lost Suttung
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.dynamis.qmOnTrade(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.dynamis.qmOnTrigger(player, npc)
end

return entity
