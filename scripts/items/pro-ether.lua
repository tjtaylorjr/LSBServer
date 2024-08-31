-----------------------------------
-- ID: 4140
-- Item: Pro-Ether
-- Item Effect: Restores 250 MP
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getMP() == target:getMaxMP() then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    elseif target:hasStatusEffect(xi.effect.MEDICINE) then
        return xi.msg.basic.ITEM_NO_USE_MEDICATED
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:messageBasic(xi.msg.basic.RECOVERS_MP, 0, target:addMP(250 * xi.settings.main.ITEM_POWER))
    target:addStatusEffect(xi.effect.MEDICINE, 0, 0, 900)
end

return itemObject
