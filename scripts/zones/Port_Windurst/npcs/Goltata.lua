-----------------------------------
-- Area: Port Windurst
--  NPC: Goltata
--  Involved in Quests: Wonder Wands
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local wonderWands = player:getQuestStatus(xi.questLog.WINDURST, xi.quest.id.windurst.WONDER_WANDS)

    if wonderWands == xi.questStatus.QUEST_ACCEPTED then
        player:startEvent(257, 0, 0, 17091)
    elseif wonderWands == xi.questStatus.QUEST_COMPLETED then
        player:startEvent(269)
    else
        player:startEvent(232)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
