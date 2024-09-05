-----------------------------------
-- Area: Windurst Walls
--  NPC: Migi Centa
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = 47.213, y = -10.000, z = 20.012, wait = 6000 },
    { x = 52.357, y = -9.728, z = 31.661, wait = 6000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(324)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
