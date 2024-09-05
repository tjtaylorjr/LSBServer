-----------------------------------
-- Area: Mhaura
--  NPC: Albin
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getZPos() <= 39 then
        player:startEvent(220)
    else
        player:startEvent(229)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
