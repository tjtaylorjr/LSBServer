-----------------------------------
-- Area: Southern San d'Oria
--  NPC: The Picture ??? in Vemalpeau's house
-- Involved in Quests: Under Oath
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCharVar('UnderOathCS') == 4 then  -- Quest: Under Oath - PLD AF3
        player:startEvent(41)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 41 and option == 1 then
        player:addKeyItem(xi.ki.STRANGE_SHEET_OF_PAPER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.STRANGE_SHEET_OF_PAPER)
    end
end

return entity
