-----------------------------------
-- Area: Western Adoulin
--  NPC: Mastan
--  Involved with Quests: 'Order Up'
--                        'The Curious Case of Melvien'
-- !pos -9 0 67 256
-----------------------------------
local ID = zones[xi.zone.WESTERN_ADOULIN]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local tccom = player:getQuestStatus(xi.questLog.ADOULIN, xi.quest.id.adoulin.THE_CURIOUS_CASE_OF_MELVIEN)
    local tccomNeedKI = player:hasKeyItem(xi.ki.MELVIENS_TURN) and not player:hasKeyItem(xi.ki.MELVIENS_DEATH)
    local orderUp = player:getQuestStatus(xi.questLog.ADOULIN, xi.quest.id.adoulin.ORDER_UP)
    local orderMastan = utils.mask.getBit(player:getCharVar('Order_Up_NPCs'), 11)

    if orderUp == xi.questStatus.QUEST_ACCEPTED and not orderMastan then
        -- Progresses Quest: 'Order Up'
        player:startEvent(70)
    elseif tccom == xi.questStatus.QUEST_ACCEPTED and tccomNeedKI then
        -- Progresses Quest: 'The Curious Case of Melvien'
        player:startEvent(184)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 70 then
        -- Progresses Quest: 'Order Up'
        player:setCharVar('Order_Up_NPCs', utils.mask.setBit(player:getCharVar('Order_Up_NPCs'), 11, true))
    elseif csid == 184 and option == 1 then
        -- Progresses Quest: 'The Curious Case of Melvien'
        player:addKeyItem(xi.ki.MELVIENS_DEATH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.MELVIENS_DEATH)
    end
end

return entity
