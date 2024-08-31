-----------------------------------
-- func: gotoid
-- desc: Go to given mob or npc ID
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'i'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!gotoid <mobId|npcId>')
end

commandObj.onTrigger = function(player, target)
    -- validate npc
    if not target or target == 0 then
        error(player, 'You must enter a mob or NPC ID.')
        return
    end

    -- is entity up?
    local isUp = false
    local targ = GetNPCByID(target)
    local pos0 = false

    if targ then
        local pos = targ:getPos()
        pos0 = (pos.x == 0 and pos.y == 0 and pos.z == 0)
        if targ:getStatus() == xi.status.NORMAL and not pos0 then
            isUp = true
        end
    else
        targ = GetMobByID(target)
        if targ then
            local pos = targ:getPos()
            pos0 = (pos.x == 0 and pos.y == 0 and pos.z == 0)
            if targ:isSpawned() and not pos0 then
                isUp = true
            end
        end
    end

    if not targ then
        player:goToEntity(target)
    elseif pos0 then
        player:printToPlayer(string.format('%s (%i) has not been given coordinates.', targ:getName(), targ:getID()))
    else
        -- determine whether we need zoneId parameter
        local gotoZone = nil
        if targ:getZoneID() ~= player:getZoneID() then
            gotoZone = targ:getZoneID()
        end

        -- display message
        if isUp then
            player:printToPlayer(string.format('Going to %s (%i) in %s.', targ:getName(), targ:getID(), targ:getZoneName()))
        else
            player:printToPlayer(string.format('%s (%i) is not currently up in %s. Going to last known coordinates.', targ:getName(), targ:getID(), targ:getZoneName()))
        end

        -- half a second later, go.  this delay gives time for previous message to appear
        player:timer(500, function(playerArg)
            playerArg:setPos(targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), gotoZone)
        end)
    end
end

return commandObj
