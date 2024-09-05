-----------------------------------
-- Area: Port Bastok
--  NPC: Door: Departures Exit
-- !pos -62 1 -8 236
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.AIRSHIP_PASS) and player:getGil() >= 200 then
        player:startEvent(141)
    else
        player:startEvent(142)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 141 then
        local xPos = player:getXPos()

        if xPos >= -58 and xPos <= -55 then
            player:delGil(200)
        end
    end
end

return entity
