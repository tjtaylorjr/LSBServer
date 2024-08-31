-----------------------------------
-- func: checkmission <Log ID> <Player>
-- desc: Prints current MissionID for the given LogID and target Player to the in game chatlog
-----------------------------------
local logIdHelpers = require('scripts/globals/log_ids')
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'ss'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!checkmission <logID> (player)')
end

commandObj.onTrigger = function(player, logId, target)
    -- validate logId
    local logName
    local logInfo = logIdHelpers.getMissionLogInfo(logId)
    if logInfo == nil then
        error(player, 'Invalid logID.')
        return
    end

    logName = logInfo.full_name
    logId = logInfo.mission_log

    -- validate target
    local targ
    if target == nil then
        targ = player:getCursorTarget()
        if targ == nil or not targ:isPC() then
            targ = player
        end
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- report mission
    local currentMission = targ:getCurrentMission(logId)

    if logId <= 3 and currentMission == 65535 then
        player:printToPlayer(string.format('No current %s mission for %s.', logName, targ:getName()))
    else
        player:printToPlayer(string.format('Current %s Mission ID is %s for %s.', logName, currentMission, targ:getName()))
    end
end

return commandObj
