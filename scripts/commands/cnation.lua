-----------------------------------
-- func: cnation <target> <campaign allegiance>
-- desc: check or alter target characters campaign allegiance
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'ss'
}

local nationNameToNum =
{
    ['NONE']     =  0,
    ['SANDORIA'] =  1,
    ['BASTOK']   =  2,
    ['WINDURST'] =  3
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!cnation <player> <campaign allegiance>')
end

commandObj.onTrigger = function(player, target, nation)
    local nationNumToName = {}

    for k, v in pairs(nationNameToNum) do
        nationNumToName[v] = k
    end

    -- validate target
    if target == nil then
        error(player, 'You must specify an online player by name.')
        return
    end

    local targ = GetPlayerByName(target)
    if targ == nil then
        error(player, string.format('Player named "%s" not found!', target))
        return
    end

    -- show or set allegiance
    if nation == nil then
        player:printToPlayer(string.format('%s\'s current campaign allegiance: %s', targ:getName(), nationNumToName[targ:getCampaignAllegiance()]))
    else
        nation = tonumber(nation) or nationNameToNum[string.upper(nation)]

        if nation == nil or nation < 0 or nation > 3 then
            error(player, 'Invalid campaign allegiange. Valid choices are SANDORIA (1), BASTOK (2), or WINDURST (3).')
            return
        end

        player:printToPlayer(string.format('%s\'s old campaign allegiance: %s', targ:getName(), nationNumToName[targ:getCampaignAllegiance()]))
        targ:setCampaignAllegiance(nation)
        player:printToPlayer(string.format('%s\'s new campaign allegiance: %s', targ:getName(), nationNumToName[targ:getCampaignAllegiance()]))
    end
end

return commandObj
