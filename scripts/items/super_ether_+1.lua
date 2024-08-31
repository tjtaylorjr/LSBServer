-----------------------------------
-- ID: 4137
-- Item: Super Ether +1
-- Item Effect: Restores 105 MP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getMP() == target:getMaxMP() then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(xi.msg.basic.RECOVERS_MP, 0, target:addMP(105 * xi.settings.main.ITEM_POWER))
end

return itemObject
