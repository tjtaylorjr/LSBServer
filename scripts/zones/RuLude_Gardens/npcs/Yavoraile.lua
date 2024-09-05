-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Yavoraile
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = 27, y = 1.996, z = 70, rotation = 128, wait = 8000 },
    { x = 30, z = 67, rotation = 0, wait = 8000 },
    { z = 69, rotation = 0, wait = 8000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
