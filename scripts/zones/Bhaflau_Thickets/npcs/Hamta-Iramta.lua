-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Hamta-Iramta
-- Type: Alzadaal Undersea Ruins
-- !pos -459.942 -20.048 -4.999 52
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        trade:getItemCount() == 1 and
        trade:hasItemQty(xi.item.IMPERIAL_SILVER_PIECE, 1)
    then
        player:tradeComplete()
        player:setPos(-458, -16, 0, 189) -- using the pos method until the problem below is fixed
        -- player:startEvent(135) -- << this CS goes black at the end, never fades in
    end
end

entity.onTrigger = function(player, npc)
    -- NPC is on a slant which makes this really difficult
    if
        player:getXPos() < -456 and
        player:getXPos() > -459 and
        player:getYPos() < -16.079
    then
        player:startEvent(134)
    elseif
        player:getXPos() < -459 and
        player:getXPos() > -462 and
        player:getYPos() < -16.070
    then
        player:startEvent(134)
    elseif
        player:getXPos() < -462 and
        player:getXPos() > -464 and
        player:getYPos() < -16.071
    then
        player:startEvent(134)
    else
        player:startEvent(136)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
