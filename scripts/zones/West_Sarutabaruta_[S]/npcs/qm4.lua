-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: qm4
-- Note: Involved in quest "The Tigress Stirs"
-- !pos 150 -39 331 95
-----------------------------------
local ID = zones[xi.zone.WEST_SARUTABARUTA_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.THE_TIGRESS_STIRS) == xi.questStatus.QUEST_ACCEPTED and
        not player:hasKeyItem(xi.ki.SMALL_STARFRUIT)
    then
        player:addKeyItem(xi.ki.SMALL_STARFRUIT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SMALL_STARFRUIT)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
