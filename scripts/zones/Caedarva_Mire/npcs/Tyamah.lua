-----------------------------------
-- Area: Caedarva Mire
--  NPC: Tyamah
-- Type: Alzadaal Undersea Ruins
-- !pos 320.003 0.124 -700.011 79
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:getItemCount() == 1 and
        trade:hasItemQty(xi.item.IMPERIAL_SILVER_PIECE, 1)
    then
        player:tradeComplete()
        player:startEvent(163)
    end
end

entity.onTrigger = function(player, npc)
    if player:getXPos() > 320 then
        player:startEvent(164)
    else
        player:startEvent(162)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 163 then
        player:setPos(-20, -4, 835, 64, 72)
    end
end

return entity
