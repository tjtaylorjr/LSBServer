-----------------------------------
-- ID: 4715
-- Scroll of Reprisal
-- Teaches the white magic Reprisal
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.REPRISAL)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.REPRISAL)
end

return itemObject
