-----------------------------------
-- Area: Windurst Woods
--  NPC: Bopa Greso
-- !pos 59.773 -6.249 216.766 241
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(xi.questLog.WINDURST, xi.quest.id.windurst.MIHGO_S_AMIGO) == xi.questStatus.QUEST_ACCEPTED then
        player:startEvent(84)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
