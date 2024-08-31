-----------------------------------
-- ID: 4246
-- Item: Cantarella
-- Item Effect: Poison 10HP / Removes 2000 HP over 10 minutes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.POISON) then
        target:addStatusEffect(xi.effect.POISON, 10, 3, 600)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
