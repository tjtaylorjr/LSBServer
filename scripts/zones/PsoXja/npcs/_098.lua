-----------------------------------
-- Area: Pso'Xja
--  NPC: _098 (Stone Gate)
-- Notes: Spawns Gargoyle when triggered
-- !pos 258.399 -1.925 -70.000 9
-----------------------------------
local psoXjaGlobal = require('scripts/zones/PsoXja/globals')
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getMainJob() == xi.job.THF and
        trade:getItemCount() == 1 and
        (
            trade:hasItemQty(xi.item.SKELETON_KEY, 1) or
            trade:hasItemQty(xi.item.LIVING_KEY, 1) or
            trade:hasItemQty(xi.item.SET_OF_THIEFS_TOOLS, 1)
        )
    then
        psoXjaGlobal.attemptPickLock(player, npc, player:getXPos() >= 259)
    end
end

entity.onTrigger = function(player, npc)
    psoXjaGlobal.attemptOpenDoor(player, npc, player:getXPos() >= 259)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 26 and option == 1 then
        player:setPos(260, -0.25, -20, 254, 111)
    end
end

return entity
