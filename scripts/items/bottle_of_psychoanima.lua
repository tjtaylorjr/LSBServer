-----------------------------------
-- ID: 5261
-- Item: Bottle Of Psychoanima
-- Item Effect: Intimidate
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if target:getEcosystem() ~= xi.ecosystem.EMPTY then -- Empty
        result = xi.msg.basic.ITEM_UNABLE_TO_USE
    elseif target:checkDistance(caster) > 10 then
        result = xi.msg.basic.TOO_FAR_AWAY
    end

    return result
end

itemObject.onItemUse = function(target, player)
    target:delStatusEffectSilent(xi.effect.INTIMIDATE)
    target:addStatusEffect(xi.effect.INTIMIDATE, 100, 0, math.random(25, 32))
end

return itemObject
