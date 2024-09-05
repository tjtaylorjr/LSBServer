-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Grilau
-- !pos -241.987 6.999 57.887 231
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getCurrentMission(xi.mission.log_id.SANDORIA) ~= xi.mission.id.sandoria.NONE then
        player:startEvent(1008) -- Wrong Item
    else
        player:startEvent(1010) -- Mission not activated
    end
end

entity.onTrigger = function(player, npc)
    if player:getNation() ~= xi.nation.SANDORIA then
        player:startEvent(1011) -- for Non-San d'Orians
    else
        local currentMission = player:getCurrentMission(xi.mission.log_id.SANDORIA)

        if currentMission ~= xi.mission.id.sandoria.NONE then
            player:startEvent(1001) -- Have mission already activated
        else
            local missionMask, repeatMask = xi.mission.getMissionMask(player)
            player:startEvent(1009, missionMask, 0, 0 , 0 , 0 , repeatMask) -- Mission List
        end
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
