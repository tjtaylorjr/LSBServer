-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Tsuchigumo
-- Involved in Quest: 20 in Pirate Years
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    if player:getCharVar('twentyInPirateYearsCS') == 3 then
        player:incrementCharVar('TsuchigumoKilled', 1)
    end
end

return entity
