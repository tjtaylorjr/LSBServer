-----------------------------------
-- Area: Southern San d'Oria [S]
--  NPC: Shixo
-- Type: Alter Ego Extravaganza
-- !gotoid 17105699
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local notes = player:getCurrency('allied_notes')

    xi.extravaganza.shadowEraTrigger(player, npc, notes)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.extravaganza.shadowEraFinish(player, csid, option, npc)
end

return entity
