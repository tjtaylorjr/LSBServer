-----------------------------------
-- Area: Windurst-Jeuno Airship
--  NPC: Mauricio
-----------------------------------
local ID = zones[xi.zone.WINDURST_JEUNO_AIRSHIP]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local vHour = VanadielHour()
    local vMin  = VanadielMinute()

    while vHour >= 4 do
        vHour = vHour - 6
    end

    local message = ID.text.WILL_REACH_WINDURST

    if vHour == -2 then
        if vMin >= 47 then
            vHour = 3
            message = ID.text.WILL_REACH_JEUNO
        else
            vHour = 0
        end
    elseif vHour == -1 then
        vHour = 2
        message = ID.text.WILL_REACH_JEUNO
    elseif vHour == 0 then
        vHour = 1
        message = ID.text.WILL_REACH_JEUNO
    elseif vHour == 1 then
        if vMin <= 40 then
            vHour = 0
            message = ID.text.WILL_REACH_JEUNO
        else
            vHour = 3
        end
    elseif vHour == 2 then
        vHour = 2
    elseif vHour == 3 then
        vHour = 1
    end

    local vMinutes = (vHour * 60) + 40 - vMin
    if message == ID.text.WILL_REACH_JEUNO then
        vMinutes = (vHour * 60) + 47 - vMin
    end

    if vMinutes <= 30 then
        if message == ID.text.WILL_REACH_WINDURST then
            message = ID.text.IN_WINDURST_MOMENTARILY
        else -- ID.text.WILL_REACH_JEUNO
            message = ID.text.IN_JEUNO_MOMENTARILY
        end
    end

    player:messageSpecial(message, math.floor((2.4 * vMinutes) / 60), math.floor(vMinutes / 60 + 0.5))
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
