-----------------------------------
-- ID: 5840
-- Item: bottle_of_stalwarts_gambir
-- Item Effect: ACC 100 RACC 100 RATTP 50 ATTP 50
-----------------------------------

---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect1   = xi.effect.ACCURACY_BOOST
    local effect2   = xi.effect.ATTACK_BOOST
    local power1    = 100 --ACC/RACC
    local power2    =  50 --ATTP/RATTP
    local duration  = 300

    xi.itemUtils.addTwoItemEffects(target, effect1, effect2, power1, power2, duration)
end

return itemObject
