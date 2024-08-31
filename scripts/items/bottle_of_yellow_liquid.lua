-----------------------------------
--  ID: 5264
--  Item: Yellow Liquid
-----------------------------------
---@type TItemFood
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    -- TODO: Can this ONLY be used on Mammet types?
    return xi.itemUtils.foodOnItemCheck(target, xi.foodType.BASIC)
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.FOOD, 0, 0, 30, 5264)
end

return itemObject
