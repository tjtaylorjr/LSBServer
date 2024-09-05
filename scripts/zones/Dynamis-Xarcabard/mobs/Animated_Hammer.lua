-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Animated Hammer
-----------------------------------
local ID = zones[xi.zone.DYNAMIS_XARCABARD]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    target:showText(mob, ID.text.ANIMATED_HAMMER_DIALOG)
end

entity.onMobFight = function(mob, target)
    -- TODO: add battle dialog
end

entity.onMobDisengage = function(mob)
    mob:showText(mob, ID.text.ANIMATED_HAMMER_DIALOG + 2)
end

entity.onMobDeath = function(mob, player, optParams)
    player:showText(mob, ID.text.ANIMATED_HAMMER_DIALOG + 1)
    xi.magian.onMobDeath(mob, player, optParams, set{ 3117 })
end

return entity
