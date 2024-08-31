-----------------------------------
-- ID: 5826
-- Item: Lucid Potion III
-- Item Effect: Restores 2000 HP
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
    target:messageBasic(xi.msg.basic.RECOVERS_HP, 0, target:addHP(2000 * xi.settings.main.ITEM_POWER))
end

return itemObject
