-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Lusiane
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.SOUTHERN_SAN_DORIA]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.item.LUGWORM,                        12, 2,
        xi.item.LITTLE_WORM,                     4, 3,
        xi.item.BAMBOO_FISHING_ROD,            561, 1,
        xi.item.YEW_FISHING_ROD,               245, 2,
        xi.item.WILLOW_FISHING_ROD,             74, 3,
        xi.item.SCROLL_OF_LIGHT_THRENODY,      124, 3,
        xi.item.SCROLL_OF_LIGHTNING_THRENODY, 1431, 3,
    }

    player:showText(npc, ID.text.LUSIANE_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.SANDORIA)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
