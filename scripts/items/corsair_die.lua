-----------------------------------
-- ID: 5493
-- Corsair Die
-- Teaches the job ability Corsair's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.CORSAIRS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.CORSAIRS_ROLL)
end

return itemObject
