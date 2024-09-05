-----------------------------------
-- Area: The Eldieme Necropolis [S]
--  NPC: Turbulent Storm
-- Note: Starts Quest "The Fighting Fourth"
-- !pos 422.461 -48.000 175
-----------------------------------
local ID = zones[xi.zone.THE_ELDIEME_NECROPOLIS_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCampaignAllegiance() > 0 then
        if player:getCampaignAllegiance() == 2 then
            player:startEvent(9)
        else
            -- message for other nations missing
            player:startEvent(9)
        end
    elseif player:hasKeyItem(xi.ki.RED_RECOMMENDATION_LETTER) then
        player:startEvent(8)
    elseif not player:hasKeyItem(xi.ki.RED_RECOMMENDATION_LETTER) then
        player:startEvent(7)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 7 and option == 0 then
        player:addKeyItem(xi.ki.BLUE_RECOMMENDATION_LETTER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.BLUE_RECOMMENDATION_LETTER)
    end
end

return entity
