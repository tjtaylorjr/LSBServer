-----------------------------------
-- ID: 5742
-- Item: Bottle of Buffalo Bonanza Milk
-- Item Effect: Restores 120 HP over 60 seconds.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.REGEN) then
        target:addStatusEffect(xi.effect.REGEN, 2, 1, 60)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
