-----------------------------------
-- Area: Windurst Walls
--  NPC: Pakeke
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -118.747, y = -5.000, z = 145.220, rotation = 128, wait = 20000 },
    { rotation = 0, wait = 20000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(292)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
