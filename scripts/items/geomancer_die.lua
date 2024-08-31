-----------------------------------
-- ID: 6368
-- Geomancer Die
-- Teaches the job ability Naturalists Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.NATURALISTS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.NATURALISTS_ROLL)
end

return itemObject
