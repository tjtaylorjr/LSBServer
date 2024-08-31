-----------------------------------
-- ID: 11666
-- Item: novennial ring
-- Experience point bonus
-----------------------------------
-- Bonus: +100%
-- Duration: 720 min
-- Max bonus: 9000 exp
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:hasStatusEffect(xi.effect.DEDICATION) then
        result = xi.msg.basic.ITEM_UNABLE_TO_USE_2
    end

    return result
end

itemObject.onItemUse = function(target)
    local effect    = xi.effect.DEDICATION
    local power     = 100
    local duration  = 43200
    local subpower  = 9000

    xi.itemUtils.addItemExpEffect(target, effect, power, duration, subpower)
end

return itemObject
