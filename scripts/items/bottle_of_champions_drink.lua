-----------------------------------
-- ID: 5392
-- Item: bottle_of_champions_drink
-- Item Effect: Haste (Magic) 18% - CRITHITRATE 5%
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect    = xi.effect.POTENCY
    local power     = 1800  --haste
    local subpower  = 5     --crit
    local duration  = 60

    xi.itemUtils.addItemEffect(target, effect, power, duration, subpower)
end

return itemObject
