-----------------------------------
-- Area: West Ronfaure
--  NPC: Signpost
-- !zone 100
-----------------------------------
local ID = zones[xi.zone.WEST_RONFAURE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local offset = npc:getID() - ID.npc.SIGNPOST_OFFSET

    if offset == 4 then
        player:startEvent(115)
    elseif offset >= 0 and offset <= 3 then
        player:startEvent(107 + offset)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
