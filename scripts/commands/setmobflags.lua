-----------------------------------
-- func: setmobflags <flags> <optional MobID>
-- desc: Used to manipulate a mob's nameflags for testing.
--       MUST either target a mob first or else specify a Mob ID.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'si'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!setmobflags <flags> (mob ID)')
end

commandObj.onTrigger = function(player, flags, target)
    -- validate flags
    if flags ~= nil and tonumber(flags) ~= nil then
        flags = tonumber(flags)
    else
        error(player, 'You must supply a flags value.')
        return
    end

    -- validate target
    local targ
    if target == nil then
        targ = player:getCursorTarget()
        if targ == nil or not targ:isMob() then
            error(player, 'You must either supply a mob ID or target a mob.')
            return
        end
    else
        targ = GetMobByID(target)
        if targ == nil then
            error(player, 'Invalid mob ID.')
            return
        end
    end

    -- set flags
    ---@diagnostic disable-next-line param-type-mismatch
    player:setMobFlags(flags, targ:getID())
    local hex = '0x' .. string.format('%08x', flags)
    player:printToPlayer(string.format('Set %s %i flags to %s (%i).', targ:getName(), targ:getID(), hex, flags))
end

return commandObj
