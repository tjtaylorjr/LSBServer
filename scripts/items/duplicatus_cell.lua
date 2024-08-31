-----------------------------------
-- Duplicatus Cell
-- ID 5373
-- Unlocks support job
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasStatusEffect(xi.effect.OBLIVISCENCE) then
        return 0
    end

    return -1
end

itemObject.onItemUse = function(target)
    target:delStatusEffectSilent(xi.effect.OBLIVISCENCE)
    target:messageText(target, zones[target:getZoneID()].text.CELL_OFFSET + 8)
end

return itemObject
