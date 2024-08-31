-----------------------------------
-- Assault: Troll Fugitives
-----------------------------------
local ID = zones[xi.zone.LEBROS_CAVERN]
-----------------------------------
local instanceObject = {}

instanceObject.afterInstanceRegister = function(player)
    local instance = player:getInstance()
    player:messageSpecial(ID.text.ASSAULT_23_START, 23)
    player:messageSpecial(ID.text.TIME_TO_COMPLETE, instance:getTimeLimit())
end

instanceObject.onInstanceCreated = function(instance)
    for i, v in pairs(ID.mob[23]) do
        SpawnMob(v, instance)
    end

    local rune = GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance)
    local box = GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance)

    if rune then
        rune:setPos(-376.272, -9.893, 89.189, 0)
    end

    if box then
        box:setPos(-384.097, -10, 84.954, 49)
    end
end

instanceObject.onInstanceCreatedCallback = function(player, instance)
    if instance then
        player:setInstance(instance)
        player:setPos(0, 0, 0, 0, instance:getZone():getID())
    end
end

instanceObject.onInstanceTimeUpdate = function(instance, elapsed)
    xi.instance.updateInstanceTime(instance, elapsed, ID.text)
end

instanceObject.onInstanceFailure = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.MISSION_FAILED, 10, 10)
        v:startEvent(102)
    end
end

instanceObject.onInstanceProgressUpdate = function(instance, progress)
    if progress >= 15 then
        instance:complete()
    end
end

instanceObject.onInstanceComplete = function(instance)
    local chars = instance:getChars()

    for i, v in pairs(chars) do
        v:messageSpecial(ID.text.RUNE_UNLOCKED, 8, 8)
    end

    local rune = GetNPCByID(ID.npc.RUNE_OF_RELEASE, instance)
    local box = GetNPCByID(ID.npc.ANCIENT_LOCKBOX, instance)

    if rune then
        rune:setStatus(xi.status.NORMAL)
    end

    if box then
        box:setStatus(xi.status.NORMAL)
    end
end

instanceObject.onEventUpdate = function(player, csid, option, npc)
end

instanceObject.onEventFinish = function(player, csid, option, npc)
end

return instanceObject
