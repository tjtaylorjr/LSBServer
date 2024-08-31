-----------------------------------
-- ID: 5839
-- Item: bottle_of_stalwarts_tonic
-- Item Effect: ACC 50 RACC 50 RATTP 25 ATTP 25
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect1   = xi.effect.ACCURACY_BOOST
    local effect2   = xi.effect.ATTACK_BOOST
    local power1    =  50 --ACC/RACC
    local power2    =  25 --ATTP/RATTP
    local duration  = 300

    xi.itemUtils.addTwoItemEffects(target, effect1, effect2, power1, power2, duration)
end

return itemObject
