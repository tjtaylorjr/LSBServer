-----------------------------------
-- ID: 4301
-- Item: Persikos au Lait
-- Item Effect: Restores 800 HP over 600 seconds
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.REGEN) then
        target:addStatusEffect(xi.effect.REGEN, 4, 3, 600)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
