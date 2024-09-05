-----------------------------------
-- Area: Halvung
--  NPC: Operating Lever D
-- TODO: more than 5/6 people still need verification as no sites show this requirment?
-----------------------------------
local ID = zones[xi.zone.HALVUNG]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(xi.ki.BRACELET_OF_VERVE) then
        GetNPCByID(ID.npc.LEVER_CD_DOOR):openDoor(30)
        player:messageSpecial(ID.text.LIFT_LEVER)
    else
        player:startEvent(100)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
