-----------------------------------
-- ID: 5505
-- Avenger's Die
-- Teaches the job ability Avengers Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.AVENGERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.AVENGERS_ROLL)
end

return itemObject
