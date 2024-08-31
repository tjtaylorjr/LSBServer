-----------------------------------
-- ID: 5852
-- Item: bottle_of_swiftshot_tonic
-- Item Effect: Double Shot +50
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect    = xi.effect.MULTI_SHOTS
    local power     = 50 --Double Shot Rate
    local duration  = 60

    xi.itemUtils.addItemEffect(target, effect, power, duration)
end

return itemObject
