-----------------------------------
-- ID: 5357
-- Item: Ether Drop
-- Item Effect: Restores 15 MP
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
    target:addMP(15 * xi.settings.main.ITEM_POWER)
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 300)
end

return itemObject
