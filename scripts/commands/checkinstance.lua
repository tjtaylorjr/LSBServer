-----------------------------------
-- func: checkinstance
-- desc: Displays Progress and Stage inside instance
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = ''
}

commandObj.onTrigger = function(player)
    local zone = player:getZone()
    if not zone then
        return
    end

    if zone:getTypeMask() == xi.zoneType.INSTANCED then
        local instance = player:getInstance()

        if not instance then
            player:printToPlayer('Must be in an Instanced zone')
            return
        end

        local progress = instance:getProgress()
        local stage = instance:getStage()

        player:printToPlayer(string.format('Progress: %i Stage: %i', progress, stage))
    else
        player:printToPlayer('Must be in an Instanced zone')
    end
end

return commandObj
