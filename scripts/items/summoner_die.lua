-----------------------------------
-- ID: 5191
-- Summoner Die
-- Teaches the job ability Evoker's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.EVOKERS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.EVOKERS_ROLL)
end

return itemObject
