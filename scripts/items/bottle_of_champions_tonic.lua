-----------------------------------
-- ID: 5843
-- Item: bottle_of_champions_tonic
-- Item Effect: Haste (Magic) 15% - CRITHITRATE 3%
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect    = xi.effect.POTENCY
    local power     = 1500  --haste
    local subpower  = 3     --crit
    local duration  = 60

    xi.itemUtils.addItemEffect(target, effect, power, duration, subpower)
end

return itemObject
