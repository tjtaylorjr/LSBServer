-----------------------------------
-- Area: Vunkerl Inlet (S) (I-6)
--  NPC: Leadavox
-- Involved in Quests
-- !pos 206 -32 316
-----------------------------------
local ID = zones[xi.zone.VUNKERL_INLET_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getQuestStatus(xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.BETTER_PART_OF_VALOR) == xi.questStatus.QUEST_ACCEPTED and
        player:getCharVar('BetterPartOfValProg') == 3
    then
        if
            trade:hasItemQty(xi.item.GNOLE_CLAW, 1) and
            trade:getItemCount() == 1 and
            trade:getGil() == 0
        then
            player:startEvent(103)
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.BETTER_PART_OF_VALOR) == xi.questStatus.QUEST_ACCEPTED then
        if player:getCharVar('BetterPartOfValProg') == 2 then
            player:startEvent(101)
        elseif player:getCharVar('BetterPartOfValProg') == 3 then
            player:startEvent(102)
        end
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 101 then
        player:setCharVar('BetterPartOfValProg', 3)
    elseif csid == 103 then
        player:tradeComplete()
        player:setCharVar('BetterPartOfValProg', 4)
        player:addKeyItem(xi.ki.XHIFHUT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.XHIFHUT)
    end
end

return entity
