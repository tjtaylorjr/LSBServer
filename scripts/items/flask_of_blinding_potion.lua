-----------------------------------
-- ID: 4163
-- Item: Blinding Potion
-- Item Effect: This potion induces blindness.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.BLINDNESS) then
        target:addStatusEffect(xi.effect.BLINDNESS, 256, 0, 180)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
