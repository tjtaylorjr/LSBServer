-----------------------------------
-- Area: Port Bastok
--  NPC: Valeriano
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.PORT_BASTOK]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.item.GINGER_COOKIE,                  12,
        xi.item.FLUTE,                          49,
        xi.item.PICCOLO,                      1144,
        xi.item.SCROLL_OF_SCOPS_OPERETTA,      677,
        xi.item.SCROLL_OF_PUPPETS_OPERETTA,  19552,
        xi.item.SCROLL_OF_FOWL_AUBADE,        3369,
        xi.item.SCROLL_OF_ADVANCING_MARCH,    2379,
        xi.item.SCROLL_OF_GODDESSS_HYMNUS,  104000,
        xi.item.SCROLL_OF_FIRE_CAROL_II,     37128,
        xi.item.SCROLL_OF_WIND_CAROL_II,     34944,
        xi.item.SCROLL_OF_EARTH_CAROL_II,    30680,
        xi.item.SCROLL_OF_WATER_CAROL_II,    32240,
        xi.item.SCROLL_OF_MAGES_BALLAD_III, 140039,
    }

    player:showText(npc, ID.text.VALERIANO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
