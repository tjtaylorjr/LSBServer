-----------------------------------
-- func: crash
-- desc: force the server process to crash
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 5,
    parameters = ''
}

commandObj.onTrigger = function(player)
    ForceCrash()
end

return commandObj
