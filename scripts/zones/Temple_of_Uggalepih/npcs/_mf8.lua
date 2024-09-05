-----------------------------------
-- Area: Temple of Uggalepih
--  NPC: _mf8 (Granite Door)
-- Note: Opens with Prelate Key
-- !pos -11 -8 -99 159
-----------------------------------
local ID = zones[xi.zone.TEMPLE_OF_UGGALEPIH]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, xi.item.PRELATE_KEY) then -- Prelate Key
        player:confirmTrade()
        player:messageSpecial(ID.text.YOUR_KEY_BREAKS, 0, xi.item.PRELATE_KEY)
        npc:openDoor(6.5)
    end
end

entity.onTrigger = function(player, npc)
    if player:getXPos() <= -8 then
        player:messageSpecial(ID.text.THE_DOOR_IS_LOCKED, xi.item.PRELATE_KEY)
    else
        npc:openDoor(11) -- retail timed
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
