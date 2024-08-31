-----------------------------------
-- func: test
-- desc: A test command module
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = '',
}

local function double_print(player, str)
    print(str)
    player:printToPlayer(str, xi.msg.channel.SYSTEM_3, '')
end

commandObj.onTrigger = function(player)
    double_print(player, 'Test print')
end

return commandObj
