-----------------------------------
--  ID: 4259
--  Item: Clear Drop
--  Intelligence 5
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(xi.effect.MEDICINE) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffect(xi.effect.INT_BOOST, 5, 0, 600)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 3600)
end

return itemObject
