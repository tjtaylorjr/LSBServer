-----------------------------------
-- ID: 5489
-- Ninja Die
-- Teaches the job ability Ninja Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.NINJA_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.NINJA_ROLL)
end

return itemObject
