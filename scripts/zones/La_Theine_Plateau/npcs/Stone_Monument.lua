-----------------------------------
-- Area: La Theine Plateau
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-- !pos 334.133 50.623 141.163 102
-----------------------------------
local ID = zones[xi.zone.LA_THEINE_PLATEAU]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(900)
end

entity.onTrade = function(player, npc, trade)
    if
        trade:getItemCount() == 1 and
        trade:hasItemQty(xi.item.LUMP_OF_SELBINA_CLAY, 1)
    then
        player:tradeComplete()
        player:addItem(xi.item.CLAY_TABLET)
        player:messageSpecial(ID.text.ITEM_OBTAINED, xi.item.CLAY_TABLET)
        player:setCharVar('anExplorer-CurrentTablet', 0x00004)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
