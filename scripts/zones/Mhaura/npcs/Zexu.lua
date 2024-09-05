-----------------------------------
-- Area: Mhaura
--  NPC: Zexu
-- Involved in Quests: The Sand Charm
-- !pos 30 -8 25 249
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCharVar('theSandCharmVar') == 1 then
        player:startEvent(123) -- During quest "The Sand Charm" - 1st dialog
    else
        player:startEvent(121) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 123 then
        player:setCharVar('theSandCharmVar', 2)
    end
end

return entity
