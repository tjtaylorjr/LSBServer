-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm_orthus_3 (???)
-- Spawns Orthus
-- !pos -823 -8.4 -390 218
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ALTEPA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.ORTHUS_OFFSET + 8, { xi.ki.STEAMING_CERBERUS_TONGUE })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
