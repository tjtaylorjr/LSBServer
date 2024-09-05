-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Sealed Entrance (Sealed_Entrance_2)
-- !pos 263.600 -6.512 40.000 95
-----------------------------------
local ID = zones[xi.zone.WEST_SARUTABARUTA_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    local snakeOnThePlains = player:getQuestStatus(xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
    local maskBit1 = utils.mask.getBit(player:getCharVar('SEALED_DOORS'), 0)
    local maskBit2 = utils.mask.getBit(player:getCharVar('SEALED_DOORS'), 1)
    local maskBit3 = utils.mask.getBit(player:getCharVar('SEALED_DOORS'), 2)

    if
        snakeOnThePlains == xi.questStatus.QUEST_ACCEPTED and
        player:hasKeyItem(xi.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
    then
        if not maskBit2 then
            player:setCharVar('SEALED_DOORS', utils.mask.setBit(player:getCharVar('SEALED_DOORS'), 1, true))

            if not maskBit1 or not maskBit3 then
                player:messageSpecial(ID.text.DOOR_OFFSET + 1, xi.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
            else
                player:messageSpecial(ID.text.DOOR_OFFSET + 4, xi.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
                player:delKeyItem(xi.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
            end
        else
            player:messageSpecial(ID.text.DOOR_OFFSET + 2, xi.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
        end
    elseif snakeOnThePlains == xi.questStatus.QUEST_COMPLETED then
        player:messageSpecial(ID.text.DOOR_OFFSET + 2, xi.ki.ZONPA_ZIPPAS_ALL_PURPOSE_PUTTY)
    else
        player:messageSpecial(ID.text.DOOR_OFFSET + 3)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
