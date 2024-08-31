-----------------------------------
-- func: haskeyitem <ID> <player>
-- desc: Checks if player has specified KeyItem.
--       Can use either of number or the variable string from keyitems.lua
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
    player:printToPlayer('!haskeyitem <key item ID> (player)')
end

commandObj.onTrigger = function(player, keyId, target)
    -- validate itemId
    if keyId == nil then
        error(player, 'You must provide a key item ID.')
        return
    else
        keyId = tonumber(keyId) or xi.ki[string.upper(keyId)]
        if keyId == nil or keyId < 1 then
            error(player, 'Invalid key item ID.')
            return
        end
    end

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

    -- report hasKeyItem
    if targ:hasKeyItem(keyId) then
        player:printToPlayer(string.format('%s has key item %i.', targ:getName(), keyId))
    else
        player:printToPlayer(string.format('%s does not have key item %i.', targ:getName(), keyId))
    end
end

return commandObj
