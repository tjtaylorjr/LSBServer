-----------------------------------
-- Area: Selbina
--  NPC: Valgeir
-----------------------------------
-- Used in: scripts/quests/otherAreas/His_Name_is_Valgeir.lua
-- Used in: scripts/quests/otherAreas/Expertise.lua
-- Used in: scripts/quests/otherAreas/The_Basics.lua
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- STANDARD DIALOG
    -- player:startEvent(140)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
