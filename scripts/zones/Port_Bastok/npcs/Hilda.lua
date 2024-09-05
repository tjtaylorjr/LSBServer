-----------------------------------
-- Area: Port Bastok
--  NPC: Hilda
-- !pos -163 -8 13 236
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -155.438, y = -11.380, z = 18.663, wait = 10000 },
    { x = -155.438, z = 18.663 },
    { x = -155.574, z = 18.439 },
    { x = -157.387, z = 15.589 },
    { x = -158.694, y = -11.047, z = 15.911 },
    { x = -160.021, y = -10.313, z = 16.424 },
    { x = -160.902, y = -10.188, z = 16.373 },
    { x = -162.387, y = -9.683, z = 15.364 },
    { x = -166.233, y = -8.705, z = 13.941 },
    { x = -162.568, y = -8.081, z = 12.267 },
    { x = -162.469, z = 12.366, wait = 10000 },
    { x = -166.233, y = -8.705, z = 13.941 },
    { x = -162.387, y = -9.683, z = 15.364 },
    { x = -160.902, y = -10.188, z = 16.373 },
    { x = -160.021, y = -10.313, z = 16.424 },
    { x = -158.694, y = -11.047, z = 15.911 },
    { x = -157.387, y = -11.380, z = 15.589 },
    { x = -155.574, y = -11.380, z = 18.439 },
    { x = -155.302, y = -11.381, z = 18.639 },
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
