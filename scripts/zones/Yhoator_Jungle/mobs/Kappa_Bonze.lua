-----------------------------------
-- Area: Yhoator Jungle
--   NM: Kappa Bonze
-- Involved in Quest: True will
-----------------------------------
local ID = zones[xi.zone.YHOATOR_JUNGLE]
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, optParams)
    if player:getQuestStatus(xi.questLog.OUTLANDS, xi.quest.id.outlands.TRUE_WILL) == xi.questStatus.QUEST_ACCEPTED then
        local lastNM = not (GetMobByID(ID.mob.KAPPA_AKUSO):isAlive() or GetMobByID(ID.mob.KAPPA_BIWA):isAlive())
        if lastNM then -- Only count the kill for the last alive/spawned NM dying
            player:incrementCharVar('trueWillKilledNM', 1)
        end
    end
end

return entity
