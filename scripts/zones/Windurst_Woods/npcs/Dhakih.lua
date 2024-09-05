-----------------------------------
-- Area: Windurst Woods
--  NPC: Dhakih
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -4.010, y = 0.000, z = 79.261, wait = 20000 },
    { x = 3.596, y = 0.000, z = 78.553, wait = 20000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, bit.bor(xi.path.flag.PATROL, xi.path.flag.RUN))
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
