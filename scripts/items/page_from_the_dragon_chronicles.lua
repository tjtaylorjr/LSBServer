-----------------------------------
-- ID: 4198
-- Item: Page from the Dragon Chronicles
-- Grants 500 - 1, 000 EXP
-- Does not grant Limit Points.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local check = 56
    if target:getMainLvl() >= 4 then
        check = 0
    end

    return check
end

itemObject.onItemUse = function(target)
    target:addExp(xi.settings.main.EXP_RATE * math.random(500, 1000))
end

return itemObject
