-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Hagakoff
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
        16399,  15448,    -- Katars (Requires Astral Candescence)
        16400,  67760,    -- Darksteel Katars
        16419,  45760,    -- Patas (Requires Astral Candescence)
        16448,    156,    -- Bronze Dagger
        16450,   2030,    -- Dagger
        16551,    776,    -- Sapara
        16552,   4525,    -- Scimitar
        16553,  38800,    -- Tulwar (Requires Astral Candescence)
        16657,   6600,    -- Tabar
        16658, 124305,    -- Darksteel Tabar (Requires Astral Candescence)
        16704,    672,    -- Butterfly Axe
        16705,   4550,    -- Greataxe (Requires Astral Candescence)
        16768,    344,    -- Bronze Zaghnal
        16770,  12540,    -- Zaghnal (Requires Astral Candescence)
        17024,     72,    -- Ash Club
        17025,   1740,    -- Chestnut Club (Requires Astral Candescence)
        18259,    238     -- Angon
    }

    player:showText(npc, ID.text.HAGAKOFF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
