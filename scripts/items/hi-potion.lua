-----------------------------------
-- ID: 4116
-- Item: Hi-Potion
-- Item Effect: Restores 100 HP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getHP() == target:getMaxHP() then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(xi.msg.basic.RECOVERS_HP, 0, target:addHP(100 * xi.settings.main.ITEM_POWER))
end

return itemObject
