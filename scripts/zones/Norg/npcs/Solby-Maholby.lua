-----------------------------------
-- Area: Norg
--  NPC: Solby-Maholby
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.NORG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        17395,     9,    -- Lugworm
        4899,    450,    -- Earth Spirit Pact
        2870,   9000,    -- Norg Waystone
        4965,  79380,    -- Scroll of Aisha: Ichi
        4966,  93243,    -- Scroll of Myoshu: Ichi
        4967,  90283,    -- Scroll of Yurin: Ichi
        4968, 133000,    -- Scroll of Migawa: Ichi
        4970, 140319,    -- Scroll of Gekka: Ichi
        4971, 140319,    -- Scroll of Yain: Ichi
        4930, 119250,    -- Scroll of Katon: San
        4933, 119250,    -- Scroll of Hyoton: San
        4936, 119250,    -- Scroll of Huton: San
        4939, 119250,    -- Scroll of Doton: San
        4942, 119250,    -- Scroll of Raiton: San
        4945, 119250,    -- Scroll of Suiton: San
    }

    player:showText(npc, ID.text.SOLBYMAHOLBY_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
