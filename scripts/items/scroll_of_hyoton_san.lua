-----------------------------------
-- ID: 4932
-- Scroll of Hyoton: San
-- Teaches the ninjutsu Hyoton: San
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.HYOTON_SAN)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.HYOTON_SAN)
end

return itemObject
