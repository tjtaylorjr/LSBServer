-----------------------------------
-- ID: 5481
-- Red Mage Die
-- Teaches the job ability Warlock's Roll
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnAbility(xi.jobAbility.WARLOCKS_ROLL)
end

itemObject.onItemUse = function(target)
    target:addLearnedAbility(xi.jobAbility.WARLOCKS_ROLL)
end

return itemObject
