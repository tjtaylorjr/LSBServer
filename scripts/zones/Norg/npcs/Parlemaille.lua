-----------------------------------
-- Area: Norg
--  NPC: Parlemaille
-----------------------------------
---@type TNpcEntity
local entity = {}

local pathNodes =
{
    { x = -20.369047, y = 1.097733, z = -24.847025 },
    { x = -20.327482, z = -25.914215 },
    { x = -20.272402, z = -27.108938 },
    { x = -20.094927, z = -26.024536 },
    { x = -19.804167, z = -13.467897 },
    { x = -20.166626, z = -29.047626 },
    { x = -20.415781, z = -30.099203 },
    { x = -20.956963, z = -31.050713 },
    { x = -21.629911, z = -31.904819 },
    { x = -22.395691, z = -32.705379 },
    { x = -23.187502, z = -33.450657 },
    { x = -24.126440, z = -33.993565 },
    { x = -25.146549, z = -34.370991 },
    { x = -24.118807, z = -34.021263 },
    { x = -23.177444, z = -33.390072 },
    { x = -22.360268, z = -32.672077 },
    { x = -21.594837, z = -31.877075 },
    { x = -20.870659, z = -30.991661 },
    { x = -20.384108, z = -29.968874 },
    { x = -20.212332, z = -28.944513 },
    { x = -20.144073, z = -27.822714 },
    { x = -20.110937, z = -26.779232 },
    { x = -19.802849, z = -13.406805 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(88)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
