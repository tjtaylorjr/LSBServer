-----------------------------------
-- Area: Qufim Island
--  NPC: Nightflowers
-- !pos -264.775 -3.718 28.767 126
-----------------------------------
local ID = zones[xi.zone.QUFIM_ISLAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local vanadielClockTime = utils.vanadielClockTime()

    if
        vanadielClockTime > 2130 or
        vanadielClockTime <= 540
    then
        player:messageSpecial(ID.text.NOW_THAT_NIGHT_HAS_FALLEN)
    else
        player:messageSpecial(ID.text.THESE_WITHERED_FLOWERS)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
