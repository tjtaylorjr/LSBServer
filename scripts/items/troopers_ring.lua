-----------------------------------
-- ID: 15560
-- Item: Trooper's Ring
-- Item Effect: Restores 100-115 HP
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
    local hpHeal = math.random(100, 115)
    local dif = target:getMaxHP() - target:getHP()
    if hpHeal > dif then
        hpHeal = dif
    end

    target:addHP(hpHeal)
    target:messageBasic(xi.msg.basic.RECOVERS_HP, 0, hpHeal)
end

return itemObject
