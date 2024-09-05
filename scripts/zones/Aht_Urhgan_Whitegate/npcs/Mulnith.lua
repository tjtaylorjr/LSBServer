-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Mulnith
-- Standard Merchant NPC
-- TODO: Stock needs to be modified based on
--       status of Astral Candescence
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
        4410,  344,    -- Roast Mushroom
        5598, 2000,    -- Sis Kebabi (Requires Astral Candescence)
        5600, 3000     -- Balik Sis (Requires Astral Candescence)
    }

    player:showText(npc, ID.text.MULNITH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
