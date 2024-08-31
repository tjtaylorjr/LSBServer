-----------------------------------
-- ID: 4424
-- Item: Melon Juice
-- Item Effect: Restores 90 MP over 135 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.REFRESH) then
        target:addStatusEffect(xi.effect.REFRESH, 2, 3, 135)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
