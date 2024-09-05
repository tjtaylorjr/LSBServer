-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Stone Monument
--  Involved in quest "An Explorer's Footsteps"
-- !pos -499.189 12.600 373.592 117
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:startEvent(900)
end

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.item.LUMP_OF_SELBINA_CLAY) and
        npcUtil.giveItem(player, xi.item.CLAY_TABLET)
    then
        player:confirmTrade()
        player:setCharVar('anExplorer-CurrentTablet', 0x01000)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
