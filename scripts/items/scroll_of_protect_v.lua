-----------------------------------
-- ID: 4655
-- Scroll of Protect V
-- Teaches the white magic Protect V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.PROTECT_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.PROTECT_V)
end

return itemObject
