-----------------------------------
-- Opacus Cell
-- 5374
-- Unlocks job abilities, weapon skills
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(xi.effect.IMPAIRMENT) then
        return 0
    end

    return -1
end

itemObject.onItemUse = function(target)
    target:delStatusEffectSilent(xi.effect.IMPAIRMENT)
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 9)
end

return itemObject
