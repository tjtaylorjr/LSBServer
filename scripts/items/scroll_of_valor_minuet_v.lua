-----------------------------------
-- ID: 5006
-- Scroll of Valor Minuet V
-- Teaches the song Valor Minuet V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.VALOR_MINUET_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.VALOR_MINUET_V)
end

return itemObject
