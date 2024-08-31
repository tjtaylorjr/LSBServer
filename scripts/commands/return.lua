-----------------------------------
-- func: return <player>
-- desc: Warps GM or target player to their previous zone
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!return (player)')
end

commandObj.onTrigger = function(player, target)
    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    -- get previous zone
    local zoneId = targ:getPreviousZone()
    if
        zoneId == nil or
        zoneId == xi.zone.UNKNOWN or
        zoneId == xi.zone.RESIDENTIAL_AREA
    then
        error(player, 'Previous zone was a Mog House or there was a problem fetching the ID.')
        return
    end

    -- zone target
    targ:setPos(0, 0, 0, 0, zoneId)
    if targ:getID() ~= player:getID() then
        player:printToPlayer(string.format('%s was returned to zone %i.', targ:getName(), zoneId))
    end
end

return commandObj
