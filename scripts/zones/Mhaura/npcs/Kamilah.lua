-----------------------------------
-- Area: Mhaura
--  NPC: Kamilah
-- Guild Merchant NPC: Blacksmithing Guild
-- !pos -64.302 -16.000 35.261 249
-----------------------------------
local ID = zones[xi.zone.MHAURA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:sendGuild(532, 8, 23, 2) then
        player:showText(npc, ID.text.SMITHING_GUILD)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
