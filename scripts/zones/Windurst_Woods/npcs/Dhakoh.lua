-----------------------------------
-- Area: Windurst Woods
--  NPC: Dhakoh
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -22.980, y = -0.090, z = 96.793 },
    { x = -20.951, y = -0.294, z = 103.448 },
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
