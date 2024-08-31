-----------------------------------
-- ID: 4930
-- Scroll of Katon: San
-- Teaches the ninjutsu Katon: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.KATON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.KATON_SAN)
end

return itemObject
