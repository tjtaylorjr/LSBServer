-----------------------------------
-- ID: 5484
-- Dark Knight Die
-- Teaches the job ability Chaos Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.CHAOS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.CHAOS_ROLL)
end

return itemObject
