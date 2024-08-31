-----------------------------------
-- ID: 4159
-- Item: Paralyze Potion
-- Item Effect: This potion induces paralyze.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if not target:hasStatusEffect(xi.effect.PARALYSIS) then
        target:addStatusEffect(xi.effect.PARALYSIS, 20, 0, 180)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
