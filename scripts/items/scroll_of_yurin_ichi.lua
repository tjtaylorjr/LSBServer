-----------------------------------
-- ID: 4967
-- Scroll of Yurin: Ichi
-- Teaches the ninjutsu Yurin: Ichi
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.YURIN_ICHI)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.YURIN_ICHI)
end

return itemObject
