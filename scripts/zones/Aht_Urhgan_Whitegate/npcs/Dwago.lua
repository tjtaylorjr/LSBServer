-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Dwago
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        17395,  9,    -- Lugworm
        17396,  3,    -- Little worm
        17016, 11,    -- Pet Food Alpha Biscuit
        17017, 82,    -- Pet Food Beta Biscuit
        17862, 98     -- Jug of Bug Broth
    }

    player:showText(npc, ID.text.DWAGO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
