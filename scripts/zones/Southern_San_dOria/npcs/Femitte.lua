-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Femitte
-- Involved in Quest: Lure of the Wildcat (San d'Oria), Distant Loyalties
-- !pos -17 2 10 230
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local distantLoyaltiesProgress = player:getCharVar('DistantLoyaltiesProgress')
    local distantLoyalties = player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.DISTANT_LOYALTIES)
    local wildcatSandy = player:getCharVar('WildcatSandy')

    if
        player:getQuestStatus(xi.questLog.SANDORIA, xi.quest.id.sandoria.LURE_OF_THE_WILDCAT) == xi.questStatus.QUEST_ACCEPTED and
        not utils.mask.getBit(wildcatSandy, 3)
    then
        player:startEvent(807)
    elseif
        player:getFameLevel(xi.fameArea.SANDORIA) >= 4 and
        distantLoyalties == 0
    then
        player:startEvent(663)
    elseif distantLoyalties == 1 and distantLoyaltiesProgress == 1 then
        player:startEvent(664)
    elseif
        distantLoyalties == 1 and
        distantLoyaltiesProgress == 4 and
        player:hasKeyItem(xi.ki.MYTHRIL_HEARTS)
    then
        player:startEvent(665)
    else
        player:startEvent(661)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 807 then
        player:setCharVar('WildcatSandy', utils.mask.setBit(player:getCharVar('WildcatSandy'), 3, true))
    elseif csid == 663 and option == 0 then
        player:addKeyItem(xi.ki.GOLDSMITHING_ORDER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.GOLDSMITHING_ORDER)
        player:addQuest(xi.questLog.SANDORIA, xi.quest.id.sandoria.DISTANT_LOYALTIES)
        player:setCharVar('DistantLoyaltiesProgress', 1)
    elseif csid == 665 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.item.WHITE_CAPE)
        else
            player:delKeyItem(xi.ki.MYTHRIL_HEARTS)
            player:addItem(xi.item.WHITE_CAPE, 1)
            player:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.WHITE_CAPE)
            player:setCharVar('DistantLoyaltiesProgress', 0)
            player:completeQuest(xi.questLog.SANDORIA, xi.quest.id.sandoria.DISTANT_LOYALTIES)
        end
    end
end

--------Other CS
--32692
--0
--661  Standard dialog
--663
--664
--665
--725
--747
--748
--807  Lure of the Wildcat
--945  CS with small mythra dancer

return entity
