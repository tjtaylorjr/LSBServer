-----------------------------------
-- ID: 13685
-- Item: Invisible Mantle
-- Item Effect: gives invisible
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    if target:hasStatusEffect(xi.effect.INVISIBLE) then
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    else
        target:addStatusEffect(xi.effect.INVISIBLE, 0, 10, math.floor(180 * xi.settings.main.SNEAK_INVIS_DURATION_MULTIPLIER))
    end
end

return itemObject
