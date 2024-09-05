-----------------------------------
-- Area: Mamool Ja Training Grounds
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local instance = npc:getInstance()

    if instance and instance:completed() then
        player:startEvent(100, 1)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.assault.instanceOnEventFinish(player, csid, xi.zone.BHAFLAU_THICKETS)
    xi.assault.runeReleaseFinish(player, csid, option, npc)
end

return entity
