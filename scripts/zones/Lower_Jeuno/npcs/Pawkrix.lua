-----------------------------------
-- Area: Lower Jeuno
--  NPC: Pawkrix
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.LOWER_JEUNO]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        631,    36, -- Horo Flour
        4458,  276, -- Goblin Bread
        4539,  650, -- Goblin Pie
        4495,   35, -- Goblin Chocolate
        4543, 1140, -- Goblin Mushpot
        952,   515, -- Poison Flour
        1239,  490, -- Goblin Doll
    }

    player:showText(npc, ID.text.PAWKRIX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
