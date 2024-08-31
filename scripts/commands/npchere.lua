-----------------------------------
-- func: npchere <npcId>
-- desc: Spawns an NPC and then moves it to the current position, if in same zone.
--       Errors will despawn the NPC unless 'noDepop' was specified (any value works).
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'is'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!npchere (npcID) (noDepop)')
end

commandObj.onTrigger = function(player, npcId, noDepop)
    -- validate npc
    local targ
    if npcId == nil then
        targ = player:getCursorTarget()
        if targ == nil or not targ:isNPC() then
            error(player, 'You must either provide an npcID or target an NPC.')
            return
        end
    else
        targ = GetNPCByID(npcId)
        if targ == nil then
            error(player, 'Invalid npcID.')
            return
        end
    end

    if player:getZoneID() == targ:getZoneID() then
        targ:setPos(player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID())
        targ:setStatus(xi.status.NORMAL)
    else
        if noDepop == nil or noDepop == 0 then
            targ:setStatus(xi.status.DISAPPEAR)
            player:printToPlayer('Despawned the NPC because of an error.')
        end

        player:printToPlayer('NPC could not be moved to current pos - you are probably in the wrong zone.')
    end
end

return commandObj
