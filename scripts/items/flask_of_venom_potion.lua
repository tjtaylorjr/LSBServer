-----------------------------------
-- ID: 4158
-- Item: Venom Potion
-- Item Effect: Removes 300 HP over 180 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.POISON) then
        target:addStatusEffect(xi.effect.POISON, 5, 3, 180)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
