-----------------------------------
-- Area: Phomiuna_Aqueducts
--  NPC: Oil Lamp - Wind (East)
-- !pos 104 -26 47
-----------------------------------
local ID = zones[xi.zone.PHOMIUNA_AQUEDUCTS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local DoorOffset = npc:getID()

    player:messageSpecial(ID.text.LAMP_OFFSET + 3) -- wind lamp
    npc:openDoor(7) -- lamp animation

    local day = VanadielDayOfTheWeek()

    if day == xi.day.WINDSDAY then
        if GetNPCByID(DoorOffset-1):getAnimation() == 8 then -- lamp earth open?
            GetNPCByID(DoorOffset-8):openDoor(15) -- Open Door _0rl
        end
    elseif day == xi.day.ICEDAY then
        if GetNPCByID(DoorOffset-5):getAnimation() == 8 then -- lamp ice open?
            GetNPCByID(DoorOffset-8):openDoor(15) -- Open Door _0rl
        end
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
