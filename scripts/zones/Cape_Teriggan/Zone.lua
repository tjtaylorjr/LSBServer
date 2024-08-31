-----------------------------------
-- Zone: Cape_Teriggan (113)
-----------------------------------
local ID = zones[xi.zone.CAPE_TERIGGAN]
-----------------------------------
require('scripts/quests/i_can_hear_a_rainbow')
-----------------------------------
local zoneObject = {}

zoneObject.onInitialize = function(zone)
    local zmeyGorynych = GetMobByID(ID.mob.ZMEY_GORYNYCH)
    if zmeyGorynych then
        zmeyGorynych:setRespawnTime(math.random(3600, 7200)) -- 1 to 2 hours
    end

    local kreutzet = GetMobByID(ID.mob.KREUTZET)
    if kreutzet then
        UpdateNMSpawnPoint(ID.mob.KREUTZET)
        kreutzet:setRespawnTime(math.random(32400, 43200)) -- 9 to 12 hours
        kreutzet:setLocalVar('cooldown', os.time() + kreutzet:getRespawnTime() / 1000)
        DisallowRespawn(kreutzet:getID(), true) -- prevents accidental 'pop' during no wind weather and immediate despawn
    end

    xi.conq.setRegionalConquestOverseers(zone:getRegionID())
end

zoneObject.onConquestUpdate = function(zone, updatetype, influence, owner, ranking, isConquestAlliance)
    xi.conq.onConquestUpdate(zone, updatetype, influence, owner, ranking, isConquestAlliance)
end

zoneObject.onZoneIn = function(player, prevZone)
    local cs = -1

    if
        player:getXPos() == 0 and
        player:getYPos() == 0 and
        player:getZPos() == 0
    then
        player:setPos(-219, 0, -318, 191)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 2
    end

    return cs
end

zoneObject.onTriggerAreaEnter = function(player, triggerArea)
end

zoneObject.onEventUpdate = function(player, csid, option, npc)
    if csid == 2 then
        quests.rainbow.onEventUpdate(player)
    end
end

zoneObject.onEventFinish = function(player, csid, option, npc)
end

zoneObject.onZoneWeatherChange = function(weather)
    local kreutzet = GetMobByID(ID.mob.KREUTZET)

    if
        kreutzet and
        not kreutzet:isSpawned() and
        os.time() > kreutzet:getLocalVar('cooldown') and
        (weather == xi.weather.WIND or weather == xi.weather.GALES)
    then
        DisallowRespawn(kreutzet:getID(), false)
        kreutzet:setRespawnTime(math.random(30, 150)) -- pop 30-150 sec after wind weather starts
    end
end

return zoneObject
