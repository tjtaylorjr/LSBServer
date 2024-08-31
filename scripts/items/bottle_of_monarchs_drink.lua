-----------------------------------
-- ID: 5393
-- Item: bottle_of_monarchs_drink
-- Item Effect: Regain
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect    = xi.effect.REGAIN
    local power     = 3
    local duration  = 180

    xi.itemUtils.addItemEffect(target, effect, power, duration)
end

return itemObject
