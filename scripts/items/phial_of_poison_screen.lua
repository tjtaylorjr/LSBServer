-----------------------------------
-- ID: 5880
-- Item: Poison Screen
-- Effect: 2 Mins of immunity to "Poison" effects.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(xi.effect.NEGATE_POISON) then
        return 56
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.NEGATE_POISON, 1, 0, 120)
end

return itemObject
