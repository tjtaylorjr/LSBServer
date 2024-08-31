-----------------------------------
-- ID: 5497
-- Bolter's Die
-- Teaches the job ability Bolters Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.BOLTERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.BOLTERS_ROLL)
end

return itemObject
