-----------------------------------
-- Area: Phomiuna Aqueducts
--  NPC: qm_west_door_j9 (???)
-- Notes: Opens west door @ J-9
-- !pos 92.542 -25.907 26.548 27
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local door = GetNPCByID(npc:getID() - 1)

    if door and door:getAnimation() == xi.anim.CLOSE_DOOR then
        door:openDoor(7) -- _0rj
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
