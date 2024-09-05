-----------------------------------
-- Area: Central Temenos 2nd Floor
--  Mob: Mystic Avatar (Ramuh)
-----------------------------------
mixins = { require('scripts/mixins/job_special') }
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    xi.mix.jobSpecial.config(mob, {
        delay = math.random(45, 90),
        specials =
        {
            { id = 893, hpp = math.random(30, 55) }, -- uses Judgment Bolt once while near 50% HPP.
        },
    })
end

return entity
