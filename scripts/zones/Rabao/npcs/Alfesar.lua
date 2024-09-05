-----------------------------------
-- Area: Rabao
--  NPC: Alfesar
--Starts The Missing Piece
-----------------------------------
local ID = zones[xi.zone.RABAO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local theMissingPiece = player:getQuestStatus(xi.questLog.OUTLANDS, xi.quest.id.outlands.THE_MISSING_PIECE)
    local fame = player:getFameLevel(xi.fameArea.SELBINA_RABAO)

    if theMissingPiece == xi.questStatus.QUEST_AVAILABLE and fame >= 4 then -- start quest
        player:startEvent(6)
    elseif
        theMissingPiece == xi.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(xi.ki.ANCIENT_TABLET_FRAGMENT)
    then
        -- talk to again with quest activated
        player:startEvent(7)
    elseif
        theMissingPiece == xi.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(xi.ki.ANCIENT_TABLET_FRAGMENT)
    then
        -- successfully retrieve key item
        player:startEvent(8)
    elseif
        theMissingPiece == xi.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(xi.ki.TABLET_OF_ANCIENT_MAGIC)
    then
        -- They got their Key items. tell them to goto sandy
        player:startEvent(9)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 6 then
        player:addQuest(xi.questLog.OUTLANDS, xi.quest.id.outlands.THE_MISSING_PIECE)
    elseif csid == 8 then -- give the player the key items he needs to complete the quest
        player:addKeyItem(xi.ki.TABLET_OF_ANCIENT_MAGIC)
        player:addKeyItem(xi.ki.LETTER_FROM_ALFESAR)
        player:delKeyItem(xi.ki.ANCIENT_TABLET_FRAGMENT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.TABLET_OF_ANCIENT_MAGIC)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.LETTER_FROM_ALFESAR)
    end
end

return entity
