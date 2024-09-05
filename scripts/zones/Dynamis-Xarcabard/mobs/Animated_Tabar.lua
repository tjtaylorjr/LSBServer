-----------------------------------
-- Area: Dynamis - Xarcabard
--  Mob: Animated Tabar
-----------------------------------
local ID = zones[xi.zone.DYNAMIS_XARCABARD]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobEngage = function(mob, target)
    target:showText(mob, ID.text.ANIMATED_TABAR_DIALOG)
end

entity.onMobFight = function(mob, target)
    -- TODO: add battle dialog
end

entity.onMobDisengage = function(mob)
    mob:showText(mob, ID.text.ANIMATED_TABAR_DIALOG + 2)
end

entity.onMobDeath = function(mob, player, optParams)
    player:showText(mob, ID.text.ANIMATED_TABAR_DIALOG + 1)
    xi.magian.onMobDeath(mob, player, optParams, set{ 3105 })
end

return entity
