-----------------------------------
-- Area: Mhaura
--  NPC: Take
-----------------------------------
-- Used in: scripts/quests/otherAreas/Rycharde_the_Chef.lua
-- Used in: scripts/quests/otherAreas/Expertise.lua
-- Used in: scripts/quests/otherAreas/The_Clue.lua
-- Used in: scripts/quests/otherAreas/The_Basics.lua
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Default Message
    -- player:startEvent(59) -- Talk abaout something else
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
