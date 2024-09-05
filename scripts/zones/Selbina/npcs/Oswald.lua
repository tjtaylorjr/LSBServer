-----------------------------------
-- Area: Selbina
--  NPC: Oswald
-- Starts and Finishes Quest: Under the sea (finish), The gift, The real gift
-- !pos 48 -15 9 248
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_GIFT) == xi.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, xi.item.DANCESHROOM)
    then
        player:startEvent(72, 0, xi.item.DANCESHROOM) -- Finish quest 'The gift'
    elseif
        player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_REAL_GIFT) == xi.questStatus.QUEST_ACCEPTED and
        npcUtil.tradeHas(trade, xi.item.SHALL_SHELL)
    then
        player:startEvent(75) -- Finish quest 'The real gift'
    end
end

entity.onTrigger = function(player, npc)
    local underTheSea  = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.UNDER_THE_SEA)
    local theSandCharm = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_SAND_CHARM)
    local theGift      = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_GIFT)
    local theRealGift  = player:getQuestStatus(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_REAL_GIFT)

    if player:getCharVar('underTheSeaVar') == 1 then
        player:startEvent(32) -- During quest 'Under the sea' - 1st dialog
    elseif player:hasKeyItem(xi.ki.ETCHED_RING) then
        player:startEvent(37) -- Finish quest 'Under the sea'
    elseif
        underTheSea == xi.questStatus.QUEST_COMPLETED and
        theSandCharm == xi.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(38) -- New dialog after 'Under the sea'
    elseif
        underTheSea == xi.questStatus.QUEST_COMPLETED and
        theSandCharm ~= xi.questStatus.QUEST_AVAILABLE and
        theGift == xi.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(70, xi.item.DANCESHROOM) -- Start quest 'The gift'
    elseif theGift == xi.questStatus.QUEST_ACCEPTED then
        player:startEvent(71) -- During quest 'The gift'
    elseif
        theGift == xi.questStatus.QUEST_COMPLETED and
        theSandCharm == xi.questStatus.QUEST_ACCEPTED
    then
        player:startEvent(78) -- New dialog after 'The gift'
    elseif
        theGift == xi.questStatus.QUEST_COMPLETED and
        theSandCharm == xi.questStatus.QUEST_COMPLETED and
        theRealGift == xi.questStatus.QUEST_AVAILABLE
    then
        player:startEvent(73, xi.item.SHALL_SHELL) -- Start quest 'The real gift'
    elseif theRealGift == xi.questStatus.QUEST_ACCEPTED then
        player:startEvent(74, xi.item.SHALL_SHELL) -- During quest 'The real gift'
    elseif theRealGift == xi.questStatus.QUEST_COMPLETED then
        player:startEvent(76) -- Final dialog after 'The real gift'
    else
        player:startEvent(30) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 32 then
        player:setCharVar('underTheSeaVar', 2)
    elseif
        csid == 37 and
        npcUtil.completeQuest(player, xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.UNDER_THE_SEA, { item = xi.item.AMBER_EARRING, fame_area = xi.fameArea.SELBINA_RABAO, title = xi.title.LIL_CUPID, var = 'underTheSeaVar' })
    then
        player:delKeyItem(xi.ki.ETCHED_RING)
    elseif csid == 70 and option == 50 then
        player:addQuest(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_GIFT)
    elseif
        csid == 72 and
        npcUtil.completeQuest(player, xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_GIFT, { item = xi.item.SLEEP_DAGGER, fame_area = xi.fameArea.SELBINA_RABAO, title = xi.title.SAVIOR_OF_LOVE })
    then
        player:confirmTrade()
    elseif csid == 73 and option == 50 then
        player:addQuest(xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_REAL_GIFT)
    elseif
        csid == 75 and
        npcUtil.completeQuest(player, xi.questLog.OTHER_AREAS, xi.quest.id.otherAreas.THE_REAL_GIFT, { item = xi.item.GLASS_FIBER_FISHING_ROD, fame_area = xi.fameArea.SELBINA_RABAO, title = xi.title.THE_LOVE_DOCTOR })
    then
        player:confirmTrade()
    end
end

return entity
