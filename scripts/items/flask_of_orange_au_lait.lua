-----------------------------------
-- ID: 4299
-- Item: Orange au Lait
-- Item Effect: Restores 100 HP over 300 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.REGEN) then
        target:addStatusEffect(xi.effect.REGEN, 1, 3, 300)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
