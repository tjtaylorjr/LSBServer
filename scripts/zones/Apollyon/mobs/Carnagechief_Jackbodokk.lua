-----------------------------------
-- Area: Apollyon CS
--  Mob: Carnagechief Jackbodokk
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

local supportOffsets1 = { 1, 2, 3 }
local supportOffsets2 = { 4, 5, 6 }

entity.onMobFight = function(mob, target)
    local content = xi.battlefield.contents[xi.battlefield.id.CS_APOLLYON]
    content.handleBossCombatTick(mob, supportOffsets1, supportOffsets2)
end

entity.onMobEngage = function(mob, target)
    local content = xi.battlefield.contents[xi.battlefield.id.CS_APOLLYON]
    content.handleBossAutoAggro(mob, target)
end

return entity
