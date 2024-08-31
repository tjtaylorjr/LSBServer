-----------------------------------
-- func: addkeyitem <ID> <player>
-- desc: Adds a key item to the player.
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
    player:printToPlayer('!addkeyitem <key item ID> (player)')
end

commandObj.onTrigger = function(player, keyId, target)
    -- validate key item id
    if keyId == nil then
        error(player, 'You must supply a Key Item ID.')
        return
    end

    keyId = tonumber(keyId) or xi.ki[string.upper(keyId)]
    if keyId == nil or keyId == 0 then
        error(player, 'Invalid Key Item ID.')
        return
    end

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

    -- add key item to target
    if targ:hasKeyItem(keyId) then
        player:printToPlayer(string.format('%s already has key item %i.', targ:getName(), keyId))
    else
        local ID = zones[targ:getZoneID()]
        targ:addKeyItem(keyId)
        targ:messageSpecial(ID.text.KEYITEM_OBTAINED, keyId)
        player:printToPlayer(string.format('Key item %i was given to %s.', keyId, targ:getName()))
    end
end

return commandObj
