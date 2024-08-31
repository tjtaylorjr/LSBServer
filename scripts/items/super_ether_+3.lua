-----------------------------------
-- ID: 4139
-- Item: Super Ether +3
-- Item Effect: Restores 120 MP
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
    target:messageBasic(xi.msg.basic.RECOVERS_MP, 0, target:addMP(120 * xi.settings.main.ITEM_POWER))
end

return itemObject
