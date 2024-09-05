-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Door : Wooden Shutter
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(5)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if option == 1 then
        player:setPos(-480, -5.65, 669, 70, 2)
    end
end

return entity
