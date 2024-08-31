-----------------------------------
-- func: setweather
-- desc: Sets the current weather for the current zone.
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
    player:printToPlayer('!setweather <weather ID>')
end

commandObj.onTrigger = function(player, weather)
    -- validate weather
    if weather == nil then
        error(player, 'You must supply a weather ID.')
        return
    end

    weather = tonumber(weather) or xi.weather[string.upper(weather)]
    if weather == nil or weather < 0 or weather > 19 then
        error(player, 'Invalid weather ID.')
        return
    end

    -- invert weather table
    local weatherByNum = {}
    for k, v in pairs(xi.weather) do
        weatherByNum[v] = k
    end

    -- set weather
    player:setWeather(weather)
    player:printToPlayer(string.format('Set weather to %s.', weatherByNum[weather]))
end

return commandObj
