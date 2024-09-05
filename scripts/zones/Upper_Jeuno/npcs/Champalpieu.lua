-----------------------------------
-- Area: Upper Jeuno
--  NPC: Champalpieu
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.UPPER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        4365, 120,    -- Rolanberry
        17320,  7,    -- Iron Arrow
        17336,  5,    -- Crossbow Bolt
        605,  180,    -- Pickaxe
        5064, 567,    -- Wind Threnody
        5067, 420,    -- Water Threnody
    }

    player:showText(npc, ID.text.MP_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
